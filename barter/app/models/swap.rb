class Swap < ActiveRecord::Base

  has_many :barts, dependent: :delete_all

  validates :name,        presence: true
  validates :description, presence: true

end
