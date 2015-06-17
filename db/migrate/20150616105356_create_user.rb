class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :login
    	t.string :password
    	t.string :email
    	t.integer :age
    	t.timestamps
    end
  end
end
