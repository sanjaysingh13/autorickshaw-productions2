class CreateStills < ActiveRecord::Migration
  def change
    create_table :stills do |t|
      t.integer :film_id
      t.string :image

      t.timestamps
    end
  end
end
