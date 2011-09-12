class ProjectsController < ApplicationController


  respond_to :json

  def skeller
    render :text => "Hi project skeller method"
  end

  def getStatus
    respond_with @categories=Category.all
  end

end
