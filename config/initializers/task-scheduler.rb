require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
scheduler.every("10s") do
    Service.achieve_service
    Service.credit_service
end