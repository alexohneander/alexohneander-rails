class AddHasHeroToPage < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :has_hero, :boolean
  end
end
