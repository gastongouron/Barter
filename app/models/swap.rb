class Swap < ActiveRecord::Base

  has_many :barts, dependent: :delete_all
  # belongs_to :user

  validates :name,        presence: true
  validates :description, presence: true

end

