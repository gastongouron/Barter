class Bart < ActiveRecord::Base

  belongs_to :user
  belongs_to :swap
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates_uniqueness_of :user_id, :scope => [:swap_id]

end
