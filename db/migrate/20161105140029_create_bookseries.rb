class CreateBookseries < ActiveRecord::Migration[5.0]
  def change
    create_table :bookseries do |t|
      t.references :book, foreign_key: true
      t.references :series, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
