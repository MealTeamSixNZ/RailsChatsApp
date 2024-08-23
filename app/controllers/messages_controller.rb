class MessagesController < ApplicationController
  before_action :authenticate_driver!
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.driver_id = current_driver.id

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
