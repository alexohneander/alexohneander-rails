class LastFmJob < ApplicationJob
  queue_as :default
  include LastFmHelper

  after_perform do |job|
    # invoke another job at your time of choice 
    self.class.set(:wait => 1.minutes).perform_later()
  end

  def perform()
    # get the current Track from API
    save_current_track_to_db()
  end
end
