class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :number
      t.string :name
      t.string :nick_name
      t.integer :project
      t.integer :final_test
      t.integer :lab
      t.integer :talking
      t.integer :final

      t.timestamps
    end
  end
end
