class Package < ApplicationRecord
  validates :name, presence :true
  validates :price, presence :true
  validates :description, presence :true

  has_many :reviews, dependent: :destroy
end
