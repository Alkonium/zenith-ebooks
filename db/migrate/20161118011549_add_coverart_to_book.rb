class AddCoverartToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :coverart, :string
  end
end
