module ConnectionHelper
    def self.is_redis_connactable
        begin
            redis = Redis.new
            redis.ping
            return true
        rescue Redis::CannotConnectError
            return false
        end
    end
end