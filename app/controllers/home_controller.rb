class HomeController < ApplicationController
  before_action :authenticate_patient!

  def index
  end
end
