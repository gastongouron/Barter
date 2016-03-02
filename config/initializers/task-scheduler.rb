require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every("20s") do
    Service.achieve_service
    Service.credit_service
end