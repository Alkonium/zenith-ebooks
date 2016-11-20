class AddManuscriptToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :manuscript, :string
  end
end
