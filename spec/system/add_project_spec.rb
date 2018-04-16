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
end
