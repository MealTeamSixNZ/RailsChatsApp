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
    @message = Message.new
    @dispatch_messages = Message.get_dispatch_messages_for_driver(@driver.id)
  end

  def create
    @message = Message.new(message_params)
    @message.staff_id = current_staff.id

    if @message.save
      redirect_back_or_to({action:"show", id:@message.driver_id})
    else
      @driver = Driver.find(@message.driver_id)
      @message = Message.new
      @dispatch_messages = Message.get_dispatch_messages_for_driver(@driver.id)
      render :show, status: :bad_request
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :message_type, :driver_id)
  end
end
