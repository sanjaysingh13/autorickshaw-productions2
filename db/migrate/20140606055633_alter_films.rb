class AlterFilms < ActiveRecord::Migration
  def change
  	add_column("films", "feature", :boolean)
  end
end
