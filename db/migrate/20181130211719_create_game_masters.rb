class CreateGameMasters < ActiveRecord::Migration[5.2]
  def change
    create_table :game_masters do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
