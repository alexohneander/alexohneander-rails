class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :artist
      t.string :song

      t.timestamps
    end
  end
end
