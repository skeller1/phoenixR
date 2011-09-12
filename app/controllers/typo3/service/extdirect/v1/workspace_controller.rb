class Typo3::Service::Extdirect::V1::WorkspaceController < ApplicationController


  include ActiveDirect::DirectController

  #direct  "TYPO3_Service_ExtDirect_V1_Controller_WorkspaceController",
 #   :getStatus => 1,
 #   :getUnpublishedNodes => 1
#
 # respond_to :json


  def getUnpublishedNodes
    respond_with(@categories = Category.all)
  end


  def getStatus
    render :text => "Hello Bob"
  end


end
