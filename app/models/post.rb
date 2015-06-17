class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :favourites

	validates :content, presence: true
	validates :title, presence: true, length: { maximum: 140 }, format: /[a-z A-Z 0-9]*/
	validates :user_id, presence: true
end