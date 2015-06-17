class Role < ActiveRecord::Base
	has_and_belongs_to_many :users

	validates :role_name, presence: true, format: /[a-z]*/
end