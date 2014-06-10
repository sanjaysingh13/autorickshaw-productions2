class AddDateToFilms < ActiveRecord::Migration
  def change
    add_column :films, :date, :date
  end
end
