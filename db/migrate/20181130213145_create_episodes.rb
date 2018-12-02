class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.references :game_master, foreign_key: true
      t.references :campaign, foreign_key: true
      t.string :title
      t.datetime :date
      t.text :summary
      t.text :notes

      t.timestamps
    end
  end
end
