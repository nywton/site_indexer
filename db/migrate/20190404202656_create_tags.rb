class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :content
      t.belongs_to :site, foreign_key: true

      t.timestamps
    end
  end
end
