require "rails_helper"

RSpec.describe "adding a todo", type: :system do
  it "allows a user to create a todo" do
    visit root_path
    fill_in "todo[todo]", with: "Todo 1"
    click_on("Add")
    visit root_path
    @todo = Todo.find_by(todo: "Todo 1")
    expect(page).to have_selector("#todo_#{@todo.id} .todo-name", text: "Todo 1")
  end

  it "does not allow a user to create a todo without text" do
    visit root_path
    fill_in "todo[todo]", with: ""
    click_on("Add")
    visit root_path
    # There should be no todos on page therefore no object with a
    # class="todo-name"
    expect(page).not_to have_selector(".todo-name")
  end
end
