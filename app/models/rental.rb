class Rental < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :city, presence: true
  has_one_attached :photo
end
