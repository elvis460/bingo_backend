class AddNameToExamSets < ActiveRecord::Migration
  def change
    add_column :exam_sets, :name, :string
  end
end
