class AddSexColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students, :sex, :string, default: 'male'
  end
end
