class HomepageController < ApplicationController
skip_before_action :authorized
  def index
    @random_suggestion= Product.select("DISTINCT category").order('RANDOM()').first(3)

  end
end
