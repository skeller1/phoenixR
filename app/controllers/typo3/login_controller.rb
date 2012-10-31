class Typo3::LoginController < ApplicationController


  respond_to :json

  def show
    @skeller = Time.now
    respond_with (@skeller)
  end

  def logout

  end

end

