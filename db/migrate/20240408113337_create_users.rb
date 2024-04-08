class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: false do |t|
      t.bigint :user_id, primary_key: true, auto_increment: true
      t.string :user_name
      t.string :user_icon
      t.timestamps
    end
  end
end
