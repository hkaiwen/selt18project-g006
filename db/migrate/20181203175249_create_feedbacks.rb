class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :feedback_text
      t.references :user
      t.timestamps
      t.integer :rating
    end
  end
end
