class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.belongs_to :user
    	t.belongs_to :post
    	t.string :content
    	t.timestamps
    end
  end
end
