class AddPostalcodeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :postalcode, :string
  end
end
