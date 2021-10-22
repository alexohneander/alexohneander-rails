require 'byebug'

module PagesHelper
    CACHE = ActiveSupport::Cache::MemoryStore.new(expires_in: 5.minutes)

    def get_menu_items
        menu_items = CACHE.fetch('menu_items') do
            menu_items = generate_menu_items()
            menu_items
        end

        return menu_items
    end

    private 
    def generate_menu_items
        menu_items = Array.new
        pages = Page.where(:published => true, :hidden => false).order(:position)

        print "pages: #{pages.count}\n"

        
        pages.each do |page|
            menu_item = MenuItem.new(page.title, page.slug)
            menu_items << menu_item
        end

        # save in cache
        CACHE.write('menu_items', menu_items)

        return menu_items
    end
end
