class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @welcome = 'Introducing the ExquisiteEvo Boomer - Unleash the Power of Elegance'
  end
end
