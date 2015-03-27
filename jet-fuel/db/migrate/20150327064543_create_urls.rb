class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full_url
      t.string :short_url
      t.string :title
      t.integer :visit_count

      t.timestamps null: false
    end
  end
end
