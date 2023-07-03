class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def list
    @books = current_user.books
    @not_completes = @books.each { |book| book.meetings.select { |meeting| meeting.complete == false } }
  end

  def index
    @books = current_user.books
  end

  def show
    @book = Book.find(params[:id])
    @meetings = @book.meetings
    @records = @book.records
  end
end
