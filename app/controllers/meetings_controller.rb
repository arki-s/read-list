class MeetingsController < ApplicationController
  def index
    @user = current_user
    @meetings = @user.meetings.where(start_time: (Time.now.beginning_of_month - 3.month).beginning_of_week..(Time.now.end_of_month + 1.month).end_of_week)
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
