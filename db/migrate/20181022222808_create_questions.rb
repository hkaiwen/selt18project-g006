class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string 'questions'
      t.string 'answer'
      t.string 'option2'
      t.string 'option3'
      t.string 'option4'
      t.string 'explanation'
      t.timestamps
    end
  end
end
