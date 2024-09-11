class NoticesController < ApplicationController
  before_action :authenticate_staff!
  before_action :ac_only

  def index
    @active_notices = Notice.active_notices
    @expired_notices = Notice.expired_notices
    @upcoming_notices = Notice.upcoming_notices
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)

    if @notice.save
      redirect_to action: "index"
    else
      render :new, status: :bad_request
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy

    redirect_to action: "index"
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])

    if @notice.update(notice_params)
      redirect_to action: "index"
    else
      render :edit, status: :bad_request
    end
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
