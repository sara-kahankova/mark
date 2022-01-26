class Review < ApplicationRecord
  belongs_to :package
  validates :name, presence: true
  validates :content, presence: true

end
