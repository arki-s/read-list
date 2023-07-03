class Meeting < ApplicationRecord
  belongs_to :book
  has_one :record
  belongs_to :user
  validates :start_date, :end_date, presence: true
  default_scope -> { order(:start_date) }

  def time
    "#{start_date.strftime('%I:%M %p')} - #{end_date.strftime('%I:%M %p')}"
  end

  def multi_days?
    (end_date.to_date - start_date.to_date).to_i >= 1
  end
end
