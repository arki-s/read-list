class Book < ApplicationRecord
  belongs_to :user
  has_many :meetings, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
end
