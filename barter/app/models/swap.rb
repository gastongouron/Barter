class Swap < ActiveRecord::Base

  has_many :barts
  validates :name,        presence: true
  validates :description, presence: true

end
