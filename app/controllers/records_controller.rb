class RecordsController < ApplicationController
  def index
  end

  def create
    @record = Record.new(params_record)
    @meeting = Meeting.find(params[:meeting_id])
    @book = Book.find(params[:book_id])
    @record.meeting = @meeting
    @record.book = @book
    if @record.save
      redirect_to book_path(@meeting.book_id)
    else
      render "books/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @record = record.find(params[:id])
    @record.destroy
    redirect_to book_path(@record.book_id), status: :see_other
  end

  private

  def params_record
    params.require(:record).permit(:book_id, :meeting_id, :rating, :review)
  end
end
