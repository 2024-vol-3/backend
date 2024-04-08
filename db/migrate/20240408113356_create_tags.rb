class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags, id: false do |t|
      
      t.bigint :tag_id, primary_key: true, auto_increment: true
      t.integer :tag_count
      t.references :issue, null: false, foreign_key: true
      t.timestamps
    end
  end
end
