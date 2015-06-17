class Profile < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 140 }, format: /[a-z A-Z 0-9]*/
	validates :hits, numericality: { only_integer: true }

	after_create :set_hits_to_zero
    after_touch :add_hit

    scope :popular, -> { where("hits>100") }

    protected 
    
    def set_hits_to_zero 
        self.hits=0 
    end 

    def add_hit
    	self.hits += 1
    end
end