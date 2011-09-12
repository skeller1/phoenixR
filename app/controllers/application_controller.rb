class ApplicationController < ActionController::Base
  protect_from_forgery

  http_basic_authenticate_with :name => ENV["TYPO3_USER"]  || "demo", :password => ENV["TYPO3_PASSWORD"] || "demo"

end
