class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups, id: false do |t|
      t.string :group_id, primary_key: true   
      t.string :group_name
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
