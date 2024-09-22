class HomeController < ApplicationController
  def index
    if staff_signed_in?
      redirect_to staff_home_index_path
    elsif driver_signed_in?
      redirect_to driver_home_index_path
    else
      render :index
    end
  end

  def staff
    if staff_signed_in?
      render :staff
    end
  end

  def driver
    if driver_signed_in?
      render :driver
    end
  end
end