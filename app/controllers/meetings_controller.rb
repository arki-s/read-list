class MeetingsController < ApplicationController
  def index
    @user = current_user
    start_date = params.fetch(:start_date, Date.today).to_date

    # @meetings = Meeting.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    @meetings = @user.meetings.where(start_date: (Time.now.beginning_of_month - 3.month).beginning_of_week..(Time.now.end_of_month + 1.month).end_of_week)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def meeting_params
  end

end
