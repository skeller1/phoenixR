module ApplicationHelper

  def base_tag
    "<base href=\"#{base}\" />".html_safe
  end

  def ext (theme = 'xtheme-blue',debug = nil, include_stylesheets = true)
    if debug.nil?
      debug = Rails.env.development? ? true : false
    end

    if include_stylesheets
      output = stylesheet_link_tag "CSS/ext-all-notheme.css"
      output += stylesheet_link_tag "CSS/#{theme}.css"
    end

    if debug
      output += javascript_include_tag "JavaScript/adapter/ext/ext-base-debug.js"
      output += javascript_include_tag "JavaScript/ext-all-debug.js"
    else
      output += javascript_include_tag "JavaScript/adapter/ext/ext-base.js"
      output += javascript_include_tag "JavaScript/ext-all.js"
    end

    output += javascript_tag do
      <<HERE
      Ext.BLANK_IMAGE_URL = '#{asset_path("images/default/s.gif")}';
      Ext.FlashComponent.EXPRESS_INSTALL_URL = '#{asset_path("Flash/expressinstall.swf")}';
      Ext.chart.Chart.CHART_URL = '#{asset_path("Flash/charts.swf")}';
HERE

    end

    return output.html_safe
  end

  def ext_direct_provider(namespace)
    provider_config = {
			'url' => '?F3_ExtJS_ExtDirectRequest=1',
			'type' => 'remoting',
			'namespace' => namespace,
			'actions' => {}
    }

    controller_match = Rails.root.join('app', 'controllers','**', '*.rb')
    controller_files=Dir.glob(domain_match)


    controller_files.each do |f|
      controller_name = File.basename(f,'.rb').capitalize
    end

    #return 'Ext.Direct.addProvider(' . json_encode($providerConfig) . ');' . chr(10);
  end

  private

  def base
    request.protocol+request.raw_host_with_port
  end


end
