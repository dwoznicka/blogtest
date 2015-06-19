class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :trackable, :validatable

    has_many :posts
	has_and_belongs_to_many :roles
	has_one :profile
	has_many :comments
	has_many :favourites

	validates :login, presence: true, length: { maximum: 30 }, format: /[a-z A-Z 0-9]*/, uniqueness: true, 
				exclusion: { in: %w(admin superuser) }
	validates :encrypted_password, presence: true, length: { maximum: 80 }, format: /[a-z A-Z 0-9]*/
	validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
	validates :age, inclusion: {in: 1..100}, numericality: true

	before_validation :ensure_login_has_a_value

	scope :old, -> { where("age>60") }

 
  	protected
    
    def ensure_login_has_a_value
      if login.nil?
        self.login = email unless email.blank?
      end
    end
end
