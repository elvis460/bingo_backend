class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :question
      t.string :answer
      t.string :tips

      t.timestamps null: false
    end
  end
end
