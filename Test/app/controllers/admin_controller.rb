class AdminController < ApplicationController
  skip_before_action :authorized
end
