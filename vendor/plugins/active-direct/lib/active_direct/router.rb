# this is the router of ActiveDirect, implemented as rack middleware
module ActiveDirect
  class Router
    def initialize(app, router_path)
      @app = app
      @router_path = router_path
    end


   def call(env)
      @env = env
      if env["PATH_INFO"].match("^#{@router_path}")
        @post_data = get_post_data
        result = process_rpc
        [200, { "Content-Type" => "text/plain"}, ["#{result}"]]

        #[200, { "Content-Type" => "text/plain"},["#{Config.method_config}"]]
      else
        @app.call(@env)
      end
    end


    def process_rpc
      resp = []

      parse(@post_data).each do |req|

        action = req.delete('extAction') || req.delete('action')
        method = req.delete('extMethod') || req.delete('method')
        data = req.delete('data')
        tid = req.delete('extTid') || req.delete('tid')

        resp << invoke_method(action, method, data, tid)
      end
      resp.to_json
    end

    def invoke_method(model, method, parameters, tid)
      result = {
        'type'    =>    'rpc',
        'tid'     =>    tid,
        'action'  =>    model,
        'method'  =>    method
      }
      if(!Config.has_model?(model))
        raise "Invalid Model."
      end

      if(!Config.has_method?(model, method))
        raise "Invalid method:#{method} called on model:#{model}."
      end
      unless parameters.nil?
        return_val = model.constantize.send(method, *normalize_params_for(model,parameters))
      else
        return_val = model.constantize.send(method)
      end
      result['result'] = return_val.nil? ?  "" : return_val
    rescue => e
      Rails.logger.error result['type'] = 'exception'
      Rails.logger.error result['message'] = e.message
      Rails.logger.error result['where'] = e.backtrace.join("\n")
    ensure
      return result
    end

    private

    def normalize_params_for(model, params)
      #if raw_post?
			#	params = params.map {|p| Hash === p ? p.symbolize_keys : p }
      #  return params
      #else
      #  normalized_params = params[model.downcase]
      #  normalized_params.each do |k, v|
      #   if v.is_a?(Hash) && v.include?('tempfile') && v['tempfile'].is_a?(Tempfile)
      #      normalized_params[k] = v['tempfile']
      #    end
      #  end
      #  [normalized_params.symbolize_keys]
      #end
    end

    def get_post_data
      params_key = @env["action_controller.request.request_parameters"] ? "action_controller.request.request_parameters" : "action_dispatch.request.request_parameters"
      @env[params_key]
    end

    def parse(data)
        return (data["_json"]) ? data["_json"] : [data]
    end

  end
end