class AddHiddenToPage < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :hidden, :boolean
  end
end
