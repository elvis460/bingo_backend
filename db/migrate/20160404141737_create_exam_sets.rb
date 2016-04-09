class CreateExamSets < ActiveRecord::Migration
  def change
    create_table :exam_sets do |t|
      t.integer :user_id
      t.string :answer ,array: true
      t.string :question , array: true
      t.string :tips , array: true

      t.timestamps null: false
    end
  end
end
