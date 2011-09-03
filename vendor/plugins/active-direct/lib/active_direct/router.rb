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

        result= form_post? ? process_form_rpc : process_rpc

        [200, { "Content-Type" => "text/plain"}, [result]]

      else
        @app.call(@env)
      end
    end


    def process_rpc
      p "started normal raw http rpc"
      resp = []
      get_raw_http.each do |req|

        action = req['action']
        method = req['method']
        data = req['data']
        tid = req['tid']

        resp << invoke_method(action, method, data, tid)
      end

      resp.to_json
    end

    def process_rpc2
      p "started normal raw http rpc"
      resp = []


      @post_data.each do |req|

        action = req['extAction'] || req['action']
        method = req['extMethod'] || req['method']
        data = req['data'] || {}
        tid = req['extTID'] || req['tid']


        resp << action
        resp << method
        resp << data
        resp << tid


        #resp << invoke_method(action, method, data, tid)
      end

      #form_post must implemented by form_and_upload?
      if form_post?
        "<html><body><textarea>#{resp.to_json}</textarea></body></html>"
      else
        resp.to_json
      end
    end

    def invoke_method(action, method, parameters, tid)
      result = {
        'type'    =>    'rpc',
        'tid'     =>    tid,
        'action'  =>    action,
        'method'  =>    method
      }
      if(!Config.has_model?(action))
        raise "Invalid Model."
      end

      if(!Config.has_method?(action, method))
        raise "Invalid method:#{method} called on model:#{action}."
      end
      unless parameters.nil?
        return_val = action.constantize.send(method, *normalize_params_for(action,parameters))
      else
        return_val = action.constantize.send(method)
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

    def normalize_params_for(action, params)
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

  
    def get_raw_http
      params_key = @env["action_controller.request.request_parameters"] ? "action_controller.request.request_parameters" : "action_dispatch.request.request_parameters"
      parse @env[params_key]
    end
    

    def parse(data)
        return (data["_json"]) ? data["_json"] : [data]
    end


    def form_post?
      @env['rack.request.form_hash']
    end

  end
end