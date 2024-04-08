class CreateIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :issues do |t|

      t.string :title
      t.text :contents
      t.boolean :day_fragment
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
