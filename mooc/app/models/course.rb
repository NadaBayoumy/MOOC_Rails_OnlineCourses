class Course < ActiveRecord::Base
	validates :title,  presence: true, length: { in: 5..300 }
	validates_uniqueness_of :title

	belongs_to :user

	has_many :likes
    has_many :users, :through => :likes
end





# describe Course do 
#    context "When testing the Course class" do 
      
#       it "should say 'Course Course' when we call the say_hello method" do 
#          crs = Course.where(course_id: 1)
#          message = crs.title 
#          expect(message).to eq "Mathematics"
#       end
      
#    end
# end