class ClearCurrentSongJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    # invoke another job at your time of choice 
    self.class.set(:wait => 1.hours).perform_later()
  end

  def perform()
    # Clear the current song in the database
    Track.destroy_all
  end
end
