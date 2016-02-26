class Help < ActiveRecord::Base

  belongs_to :user
  belongs_to :service
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates_uniqueness_of :user_id, :scope => [:service_id]

end
