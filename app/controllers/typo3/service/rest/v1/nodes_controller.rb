class Typo3::Service::Rest::V1::NodesController < ApplicationController

  layout false

  respond_to :json


  def getStatus
    render :json => {:name => "getStatus"}
  end

  def getUnpublishedNodes
    render :json => {:unpublishedNodesCount => Random.rand(99)}
  end

end

