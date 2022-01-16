class Review < ApplicationRecord
  belongs_to :package
  validates :name, presence :
  validates :content, presence :

end
