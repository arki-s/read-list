class Record < ApplicationRecord
  belongs_to :book
  belongs_to :meeting
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :review, presence: true
end
