class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :course_type

      t.timestamps
    end
  end
end
