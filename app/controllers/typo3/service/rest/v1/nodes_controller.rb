class Typo3::Service::Rest::V1::NodesController < ApplicationController

  layout false


  extdirect :name => "TYPO3_Service_ExtDirect_V1_NodesController", :methods => {
    :getStatus => 1,
    :getUnpublishedNodes => 1 }


  respond_to :json


  def getStatus
    render :json => {:name => "getStatus"}
  end

  def getUnpublishedNodes
    render :json => {:unpublishedNodesCount => Random.rand(99)}
  end

end

