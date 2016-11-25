class CreateProvinces < ActiveRecord::Migration[5.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.integer :GST
      t.integer :PST
      t.string :HST
      t.string :integer

      t.timestamps
    end
  end
end
