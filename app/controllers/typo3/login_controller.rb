class Typo3::LoginController < ApplicationController


  respond_to :json


  extdirect  :name => "TYPO3_Controller_LoginController", :methods =>{:show => 1, :logout => 1}



  def show
    @skeller = Time.now
    respond_with (@skeller)
  end

  def logout

  end

end

