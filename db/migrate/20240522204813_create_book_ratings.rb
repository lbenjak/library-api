class CreateBookRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :book_ratings do |t|
      t.references :book, null: false, foreign_key: true
      t.references :rating, null: false, foreign_key: true

      t.timestamps
    end
  end
end
