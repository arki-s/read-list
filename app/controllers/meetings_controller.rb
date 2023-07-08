class MeetingsController < ApplicationController
  def index
    @user = current_user
    @meetings = @user.meetings.where(start_time: (Time.now.beginning_of_month - 3.month).beginning_of_week..(Time.now.end_of_month + 1.month).end_of_week)
  end

  def show
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user_id = current_user.id
    if @meeting.save
      redirect_to list_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @book = Book.find(@meeting.book_id)
    @user = User.find(@meeting.user_id)
  end

  def update
    @meeting = Meeting.find(params[:id])
    @book = Book.find(@meeting.book_id)
    @user = User.find(@meeting.user_id)
    if @meeting.update(meeting_params)
      if @meeting.complete == true
        redirect_to book_path(@book)
      else
        redirect_to list_path
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def meeting_params
    params.require(:meeting).permit(:complete, :user_id, :book_id, :start_time, :end_time)
  end

end
