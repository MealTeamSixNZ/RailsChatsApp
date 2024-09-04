class HomeController < ApplicationController
  def index
    if staff_signed_in?
      redirect_to staff_messages_path
    elsif driver_signed_in?
      redirect_to messages_path
    else
      render :index
    end
  end
end
