class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.text :content
    	t.string :title
    	t.belongs_to :user
    	t.timestamps
    end
  end
end
