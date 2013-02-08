module ApplicationHelper
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

      output += javascript_tag(
        <<HERE
        Ext.BLANK_IMAGE_URL = '#{asset_path("images/default/s.gif")}';
        Ext.FlashComponent.EXPRESS_INSTALL_URL = '#{asset_path("Flash/expressinstall.swf")}';
        Ext.chart.Chart.CHART_URL = '#{asset_path("Flash/charts.swf")}';
HERE
      )

    return output.html_safe
  end

end
