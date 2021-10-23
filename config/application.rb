require_relative "boot"

require "rails/all"
require 'sidekiq/api'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Alexohneander
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Set sidekiq as the application job queue adapter
    #config.active_job.queue_adapter = :sidekiq

    config.after_initialize do
      #empty_queue()

      #LastFmJob.perform_later
      #ClearCurrentSongJob.set(wait: 1.hour).perform_later
    end

    def empty_queue
      Sidekiq::Queue.new("default").clear
      Sidekiq::RetrySet.new.clear
      Sidekiq::ScheduledSet.new.clear
    end
  end
end
