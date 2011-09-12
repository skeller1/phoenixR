class Typo3::Service::Extdirect::V1::WorkspaceController < ApplicationController


  skip_before_filter :verify_authenticity_token

  include ActiveDirect::DirectController

  direct  "TYPO3_Service_ExtDirect_V1_Controller_WorkspaceController",
    :getStatus => 1,
    :getUnpublishedNodes => 1


  respond_to :json


  def getUnpublishedNodes
    @unpublished=0
    respond_with(@unpublished)
  end


  def getStatus
    @unpublished=0
    @mike = {
      :data => {
        :name => "user-skeller1",
        :unpublishedNodesCount => @unpublished
      },
      :success => true
    }
    #
    render :json => @mike.to_json
    #respond_with(@unpublished)
  end

end
