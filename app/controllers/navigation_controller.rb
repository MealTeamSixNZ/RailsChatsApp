class NavigationController < ApplicationController
  def index
    if staff_signed_in?
      redirect_to navigation_path
    elsif driver_signed_in?
      redirect_to navigation_path
    else
      render :index
    end
  end
end
