class Typo3::Service::Extdirect::V1::WorkspaceController < ApplicationController

  layout false

  skip_before_filter :verify_authenticity_token

  include ActiveDirect::DirectController

  direct  "TYPO3_Service_ExtDirect_V1_Controller_WorkspaceController",
    :getStatus => 1,
    :getUnpublishedNodes => 1


  respond_to :json


  def getUnpublishedNodes
    @unpublished=Random.rand(99)
    respond_with(@unpublished)
  end


  def getStatus
    @unpublished=Random.rand(99)
    respond_with(@unpublished)
  end

end
