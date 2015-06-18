class CreateRole < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.string :role_name
  		t.timestamps
    end

    create_table :roles_users do |t|
    	t.belongs_to :user
    	t.belongs_to :role
    	t.timestamps
    end
  end
end
