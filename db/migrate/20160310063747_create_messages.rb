class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender_name
      t.string :sender_email
      t.string :message
      t.integer :signup_id

      t.timestamps null: false
    end
  end
end
