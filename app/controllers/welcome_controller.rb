class WelcomeController < ApplicationController

  def index
    @cities = City.all
  end

end
