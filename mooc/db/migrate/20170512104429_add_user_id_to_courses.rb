class AddUserIdToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :user_id, :integer
  	add_column :lectures, :user_id, :integer
  end
end
