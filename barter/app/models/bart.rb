class Bart < ActiveRecord::Base

  belongs_to :swap
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

end
