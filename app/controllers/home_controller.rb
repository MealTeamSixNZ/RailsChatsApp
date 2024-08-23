class HomeController < ApplicationController
  def index
  end

  def staff_only
    before_action :authenticate_staff!
  end

  def drivers_only
    before_action :authenticate_driver!
  end
end
