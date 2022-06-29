class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include Language
  include Pagy::Backend
end
