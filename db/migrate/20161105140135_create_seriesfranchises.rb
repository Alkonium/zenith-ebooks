class CreateSeriesfranchises < ActiveRecord::Migration[5.0]
  def change
    create_table :seriesfranchises do |t|
      t.references :series, foreign_key: true
      t.references :franchise, foreign_key: true

      t.timestamps
    end
  end
end
