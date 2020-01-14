class SessionsController < ApplicationController
  authorize_resource class: false
end
