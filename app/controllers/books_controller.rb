class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def list
    @books = current_user.books
    @not_completes = []
    @books.each { |book| book.meetings.each { |meeting| @not_completes << meeting if meeting.complete == false } }
  end

  def index
    @books = current_user.books
  end

  def show
    @book = Book.find(params[:id])
    @meetings = @book.meetings
  end
end
