require 'test_helper'

class TodoTest < ActionDispatch::IntegrationTest
  test "Add a todo" do
    get "/todos/new"

    # check for input fields
    assert_select "input[type=text][name='todo[todo]']"
    assert_select "input[type=checkbox][name='todo[completed]']"

    # save new todo
    assert_difference('Todo.count') do
      post '/todos', params: {todo: {
          todo: "integration todo 1"
        }
      }
    end

    # check redirect
    assert_redirected_to "/todos/#{assigns(:todo).id}"
    follow_redirect!
  end
end
