require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = User.create(username: "luis", email: "luis@example.com")
    @post = @user.posts.build(title: "The start of a better prespective.", description: "B|A will help friends and people form near by to expand.")

  end

  test "post should be valid" do
    assert @post.valid?
  end

  test "user_id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "Title should be present" do
    @post.title = " "
    assert_not @post.valid?
  end

  test "Title lenght should not be too long" do
    @post.title = "a" * 150
    assert_not @post.valid?
  end

  test "Title lenght should not be to short" do
    @post.title = "a"
    assert_not @post.valid?
  end

  test "description must be present" do
    @post.description = " "
    assert_not @post.valid?
  end

  test "description should not be too long" do
    @post.description = "a" * 2001
    assert_not @post.valid?
  end

  test "description should not be too short" do
    @post.description = "a" * 19
    assert_not @post.valid?
  end

end
