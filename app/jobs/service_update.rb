class ServiceUpdate < ActiveJob::Base
  #queue_as :default

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

    # when service achievedn if someone helped, credit this person adn save.
    # else, dont credit anyone and give redit back to user.
    # later conflict logic comes here :)
    ended_jobs = Service.where(archived: true, credited: false)
    users_to_credit_once = []

    ended_jobs.each do |job|
     users_to_credit_once << job.helper_id
    end

    users_to_credit_once.each do |user|
      user.timecoins += 1
      user.save
    end

  end

end

# if this logic fails make it happen on index route for service#index first. cause service.all loads here :)