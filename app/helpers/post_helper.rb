module PostHelper
    CACHE = ActiveSupport::Cache::MemoryStore.new(expires_in: 5.minutes)

    def get_post_preview_items
        post_items = CACHE.fetch('post_items') do
            Post.all.where(:published => true).order(created_at: :desc).limit(3)
        end

        return post_items
    end
end
