class MessagesController < ApplicationController
  before_action :authenticate_driver!
  def index
    @message = Message.new
    @dispatch_messages = Message.get_dispatch_messages_for_driver(current_driver.id)
    @area_messages = Message.get_area_messages_for_driver(current_driver.id)
  end

  def create
    @message = Message.new(message_params)
    @message.driver_id = current_driver.id
    # @message.message_type = "D"

    if @message.save
      redirect_to @message
    else
      @messages = Message.all
      render :index, status: :bad_request
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
