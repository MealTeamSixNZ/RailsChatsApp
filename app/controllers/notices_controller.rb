class NoticesController < ApplicationController
  before_action :authenticate_staff!
  before_action :ac_only

  def index
    @notices = Notice.all
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)

    if @notice.save
      redirect_to :index
    else
      render :new, status: :bad_request
    end
  end

  def destroy

  end

  def edit

  end

  private

  def notice_params
    params.require(:notice).permit(:title, :content, :start_date, :start_time, :end_date, :end_time)
  end

  def ac_only
    if current_staff.staff_type != "A"
      flash[:alert] = "Vorsicht, ACs nur!"
      redirect_to root_path
    end
  end
end
