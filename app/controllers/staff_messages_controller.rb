class StaffMessagesController < ApplicationController
  before_action :authenticate_staff!

  def index
    @areas = Area.all
    args = params.permit(:area_id)
    @area_id = args[:area_id]

    unless @area_id == nil
      @drivers = Driver.where(area_id:@area_id)
    end
  end

  def show
    @driver = Driver.find(params[:id])
    # @driver_list = Driver.all.where(:area_id => driver_params)
  end

  def create

  end

  private

  def driver_params
    params.require(:message).permit(:area_id)
  end
end
