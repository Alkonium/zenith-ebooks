class AddTitleToInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :infos, :title, :string
  end
end
