class NoticesController < ApplicationController

  def index
    authenticate_any!
    @active_notices = Notice.active_notices
    @expired_notices = Notice.expired_notices
    @upcoming_notices = Notice.upcoming_notices
  end

  def new
    authenticate_staff!
    ac_only
    @notice = Notice.new
    @notice.start_datetime = DateTime.current
    @notice.end_datetime = nil
  end

  def create
    authenticate_staff!
    ac_only
    @notice = Notice.new(notice_params)

    if @notice.save
      redirect_to action: "index"
    else
      render :new, status: :bad_request
    end
  end

  def destroy
    authenticate_staff!
    ac_only
    @notice = Notice.find(params[:id])
    @notice.destroy

    redirect_to action: "index"
  end

  def edit
    authenticate_staff!
    ac_only
    @notice = Notice.find(params[:id])
  end

  def update
    authenticate_staff!
    ac_only
    @notice = Notice.find(params[:id])

    if @notice.update(notice_params)
      redirect_to action: "index"
    else
      render :edit, status: :bad_request
    end
  end

  def expire
    authenticate_staff!
    ac_only
    @notice = Notice.find(params[:id])
    @notice.end_datetime = DateTime.current

    if @notice.save
      redirect_to action: "index"
    else
      flash.now[:alert] = "Something went wrong"
      render :edit, status: :bad_request
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :content, :start_datetime, :end_datetime)
  end

  def ac_only
    if current_staff.staff_type != "Area Coordinator"
      flash[:alert] = "Vorsicht, ACs nur!"
      redirect_to root_path
    end
  end

  def authenticate_any!
    if driver_signed_in? || staff_signed_in?
      true
    else
      flash[:alert] = "Verboten!"
      redirect_to home_index_path
    end
  end
end
