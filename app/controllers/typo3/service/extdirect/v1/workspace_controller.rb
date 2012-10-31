class Typo3::Service::Extdirect::V1::WorkspaceController < ApplicationController

  layout false

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

