require 'test_helper'

class UserTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save task without description" do
    user_task = UserTask.new
    user_task.due = Date.new(2015, 10, 31)
    assert_not user_task.save, "Saved the task without a description"
  end

  test "should not save a task without a due date" do
    user_task = UserTask.new
    user_task.description = "Make groceries"
    assert_not user_task.save, "Saved the task without a due date"
  end
end
