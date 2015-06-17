class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates :content, presence: true, length: { maximum: 140 }, format: /[a-z A-Z 0-9]*/
	validates :user_id, presence: true
	validates :post_id, presence: true
end