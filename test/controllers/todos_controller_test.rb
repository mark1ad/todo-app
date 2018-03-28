require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:todo1)
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post todos_url, params: { todo: { completed: @todo.completed, todo: @todo.todo } }
    end
    assert_redirected_to :root
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { completed: @todo.completed, todo: @todo.todo } }
    assert_redirected_to :root
  end

  test "should destroy todo" do
    assert_difference('Todo.count', -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to :root
  end
end
