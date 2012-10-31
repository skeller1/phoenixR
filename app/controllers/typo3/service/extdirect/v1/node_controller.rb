class Typo3::Service::Extdirect::V1::NodeController < ApplicationController

  respond_to :json


  def getChildNodesForTree
    @unpublished=0
    respond_with(@unpublished)
  end

  def getChildNodes
    #render :json => Time.now
    #@unpublished=0
    #respond_with(@unpublished
  end

end

