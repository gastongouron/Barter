class Service < ActiveRecord::Base

  acts_as_mappable

  has_many  :helps, dependent: :delete_all
  has_many  :permissions, as: :thing

  validates :name,        presence: true
  validates :description, presence: true

  scope :viewable_by, ->(user) do
    joins(:permissions).where(permissions: { action: "view", user_id: user.id })
  end

  # def self.do_something

  # end

  def self.achieve_service
    services = Service.all
    services.each do |service|
      if service.start < Time.now
      service.archived = true

      service.save
      end
    end
  end

  # def self.credit_service

    # when service achievedn if someone helped, credit this person adn save.
    # else, dont credit anyone and give redit back to user.
    # later conflict logic comes here :)
  #   ended_jobs = Service.where(archived: true, credited: false)
  #   users_to_credit_once = []

  #   ended_jobs.each do |job|
  #    users_to_credit_once << job.helper_id
  #   end

  #   users_to_credit_once.each do |user|
  #     user.timecoins += 1
  #     user.save
  #   end

  # end


end

