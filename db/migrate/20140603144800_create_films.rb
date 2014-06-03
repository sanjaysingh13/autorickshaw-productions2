class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.text :link
      t.string :url
      t.text :writeup
      t.text :credits

      t.timestamps
    end
  end
end
