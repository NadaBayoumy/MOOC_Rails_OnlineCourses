class CreateSpams < ActiveRecord::Migration
  def change
    create_table :spams do |t|
    	t.integer :lecture_id
    	t.integer :user_id
    end
  end
end
