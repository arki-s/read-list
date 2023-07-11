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

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
    @meetings = @book.meetings
  end

  def analytics
    @books = current_user.books
    @meetings = current_user.meetings
    avetotal = 0
    @meetings.each { |meeting| avetotal += (meeting.end_time - meeting.start_time) }
    @book_count = @books.count
    @average_time_total = ((avetotal / @meetings.count) / 1.day).round(2)
    @total_reading = @meetings.select { |meeting| meeting.complete == true }.count

    def count_monthly(month)
      meetings = current_user.meetings
      meetings.select { |meeting| meeting.end_time.month == month }.count
    end

    def show_month(month)
      m = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
      m[month - 1]
    end

    this_month = Date.today.month
    @chart_data = {
      labels: [show_month(this_month - 4), show_month(this_month - 3), show_month(this_month - 2), show_month(this_month - 1), show_month(this_month)],
      datasets: [{
        label: 'Number of reading',
        backgroundColor: 'transparent',
        borderColor: '#df5656',
        data: [count_monthly(this_month - 4), count_monthly(this_month - 3), count_monthly(this_month - 2), count_monthly(this_month - 1), count_monthly(this_month)]
      }]
    }

    @chart_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :user_id)
  end
end
