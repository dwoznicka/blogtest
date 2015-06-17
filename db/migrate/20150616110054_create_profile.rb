class CreateProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string :title
    	t.integer :hits
    	t.belongs_to :user
    	t.timestamps
    end
  end
end
