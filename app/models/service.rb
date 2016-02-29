class Service < ActiveRecord::Base

  acts_as_mappable

  has_many  :helps, dependent: :delete_all
  has_many  :permissions, as: :thing

  validates :name,        presence: true
  validates :description, presence: true

  scope :viewable_by, ->(user) do
    joins(:permissions).where(permissions: { action: "view", user_id: user.id })
  end

  def self.achieve_service
    services = Service.all
    services.each do |service|
      if service.start < Time.now
      service.archived = true

      service.save
      end
    end
  end

  def self.credit_service

    p ended_jobs = Service.where(archived: true, credited: false)

    users_to_credit_once = []

    ended_jobs.each do |job|
     users_to_credit_once << job.helper_id
     job.credited = true
     job.save
    end

    users_to_credit_once.each do |user_id|
      user = User.find_by(id: user_id)
      user.timecoin += 1
      user.save
    end

  end


end

