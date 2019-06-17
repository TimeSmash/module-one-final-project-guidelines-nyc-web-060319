class CreateGames < ActiveRecord::Migration[4.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :genre
      t.string :platforms
    end
  end
end
