class ApplicationController < ActionController::Base
  protect_from_forgery



  def skeller
    render :json => Time.now
  end
end
