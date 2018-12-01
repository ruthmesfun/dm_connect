class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :town_name
      t.integer :population
      t.text :description
      t.text :summary

      t.timestamps
    end
  end
end
