class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :genre
      t.string :plot
      t.string :poster
      t.float :rating

      t.timestamps
    end
  end
end
