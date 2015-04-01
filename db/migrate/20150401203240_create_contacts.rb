class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.bigint :user_number
      t.integer :user_id
    end
  end
end
