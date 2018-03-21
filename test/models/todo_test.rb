require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "missing todo field" do
    # todo = Todo.new({completed: false})
    todo = Todo.new({})
    assert !todo.valid?, "Todo should not be valid without a todo"
  end

  test "presence of todo field" do
    todo = Todo.new({todo: "stuff", completed: false})
    assert todo.valid?, "Todo should be valid with a todo"
  end

  test "should not save without todo" do
    todo = Todo.new
    assert_not todo.save, "Saved the todo without a todo field"
  end
end
