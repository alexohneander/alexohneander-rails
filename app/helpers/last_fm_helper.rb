require 'httparty'
require 'byebug'

module LastFmHelper
    CACHE = ActiveSupport::Cache::MemoryStore.new(expires_in: 1.minutes)

    def get_current_track
        output = CACHE.fetch("current_track", :expires_in => 1.minutes) do
            # Get the current track from db
            track = Track.first
            if track.nil?
                track = save_current_track_to_db()
            end
            output = "<p><i class='fab fa-apple'></i> <b>#{track.artist} - #{track.song}</b> - Apple Music</p>"
        end
        return output
    end

    def save_current_track_to_db
        # get current track
        current_track = get_current_track_from_last_fm()

        # create new track
        track = Track.new
        track.artist = current_track.split(" - ")[0]
        track.song = current_track.split(" - ")[1]

        # check if track is already in db
        saved_track = Track.first
        if saved_track.nil?
            track.save
        else
            saved_track.update(artist: track.artist, song: track.song)
            saved_track.save
        end

        return track
    end

    def get_current_track_from_last_fm
        # Constants
        api_key = ENV["LASTFM_APIKEY"]
        lastfm_username = ENV["LASTFM_USERNAME"]
        lastfm_api_endpoint = "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=#{lastfm_username}&api_key=#{api_key}&format=json"

        # request lastfm api
        response = HTTParty.get(lastfm_api_endpoint)
        
        # parse json
        json = JSON.parse(response.body)
        
        if json.nil?
            return "No data"
        elsif !json["error"].nil?
          return "Error"
        end

        # get current track
        current_track = json["recenttracks"]["track"][0]

        # get artist and song
        artist = current_track["artist"]["#text"]
        song = current_track["name"]
        playing = current_track["@attr"]

        print "LastFM:", "Got latest Track, #{artist} - #{song}"

        current_track = "#{artist} - #{song}"

        # return artist and song
        return current_track
    end
end
