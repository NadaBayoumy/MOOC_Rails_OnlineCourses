ActiveRecord::Migration.maintain_test_schema!
require 'test_helper'

class UserTest < ActiveSupport::TestCase
	  # test "the truth" do
	  #   assert true
	  # end

	  def setup
         @user = users(:valid_user)
      end



   #    test "should not save article without title" do
		 #  article = Article.new
		 #  assert_not article.save
	  # end



	  test 'valid user' do
	  	puts :valid_user
	    user = users(:valid_user)
	    assert user.valid?
	  end

	  test 'invalid without name' do
	    user = users(:invalid_user_without_name)
	    refute user.valid?, 'user is valid without a name'
	    assert_not_nil user.errors[:name], 'no validation error for name present'
	  end

	  test 'invalid without email' do
	    user = users(:invalid_user_without_email)
	    refute user.valid?
	    assert_not_nil user.errors[:email]
	  end

	  # test 'test_title_is_required' do
		 #  @article.valid?
		 #  assert_includes(@article.errors[:title], "can’t be blank")
	  # end


end
