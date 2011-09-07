class Typo3::Service::Extdirect::V1::WorkspaceController < ApplicationController

  #include ActiveDirect::ExtJs::Controller

  #direct_actions :getStatus => 1

  def index
    render :text => "ExtDirectWorkspaceController index"
  end

  def getStatus
    render :text => "ExtDirectWorkspaceController get status"
  end


end
