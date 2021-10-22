class AddSlugToPage < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :slug, :string
  end
end
