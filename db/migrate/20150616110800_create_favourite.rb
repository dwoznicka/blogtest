class CreateFavourite < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
    	t.belongs_to :user
    	t.belongs_to :post
    	t.timestamps
    end
  end
end
