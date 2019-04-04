class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :url

      t.timestamps
    end
    add_index :sites, :url
  end
end
