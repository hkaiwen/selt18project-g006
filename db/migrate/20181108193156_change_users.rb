class ChangeUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.remove :user_id
      t.remove :password
      t.remove :email_id
    end
  end
end
