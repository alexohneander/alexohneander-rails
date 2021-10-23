module ConnectionHelper
    def self.is_redis_available
        begin
            redis = Redis.new
            redis.ping
            return true
        rescue Redis::CannotConnectError
            return false
        end
    end
end