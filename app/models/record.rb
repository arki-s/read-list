class Record < ApplicationRecord
  belongs_to :book
  belongs_to :meeting
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :review, presence: true
  has_many :records_as_owner, through: :book, source: :records
end
