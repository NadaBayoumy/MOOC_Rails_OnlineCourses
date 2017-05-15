require 'test_helper'

class CourseTest < ActiveSupport::TestCase
 
  test 'valid course' do
  	# puts :valid_user
    course = courses(:valid_course)
    assert course.valid?
  end


end
