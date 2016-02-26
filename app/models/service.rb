class Service < ActiveRecord::Base

  acts_as_mappable

  has_many  :helps, dependent: :delete_all
  has_many  :permissions, as: :thing

  validates :name,        presence: true
  validates :description, presence: true

  scope :viewable_by, ->(user) do
    joins(:permissions).where(permissions: { action: "view", user_id: user.id })
  end


end

