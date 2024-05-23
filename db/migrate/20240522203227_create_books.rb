class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.integer :number_of_copies, null: false, default: 0
      t.string :isbn, null: false
      t.integer :pages, null: false
      t.date :published_at, null: false

      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
