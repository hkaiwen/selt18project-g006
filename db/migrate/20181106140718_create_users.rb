class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string 'user_id'
      t.string 'password'
      t.string 'first_name'
      t.string 'last_name'
      t.string 'email_id'
      t.string 'session_token'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
