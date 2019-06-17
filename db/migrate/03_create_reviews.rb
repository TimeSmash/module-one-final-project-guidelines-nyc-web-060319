class CreateReviews < ActiveRecord::Migration[4.2]
  def change
    create_table :reviews do |t|
      t.integer :player_id
      t.integer :game_id
      t.float :rating
      t.string :text
    end
  end
end
