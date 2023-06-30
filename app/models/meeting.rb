class Meeting < ApplicationRecord
  belongs_to :book
  has_one :record
  validates :start_date, presence: true
  validates :end_date, presence: true
end
