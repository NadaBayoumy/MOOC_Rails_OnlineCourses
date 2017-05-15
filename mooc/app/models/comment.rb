class Comment < ActiveRecord::Base
	validates :content,  presence: true, length: { maximum: 1000 }

    belongs_to :lecture
    belongs_to :user
    
end
