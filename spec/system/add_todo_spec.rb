require "rails_helper"

RSpec.describe "adding a todo", type: :system do
  it "allows a user to create a todo" do
    visit "/"
    # TODO: Finds the new todo text field by looking for the placeholder value.
    # Probably not the best way to find it
    fill_in "New Todo", with: "New Test Todo"
    click_on("Add")
    visit "/"
    @new_todo = Todo.find_by(todo: "New Test Todo")
    expect(page).to have_selector("#to_#{@new_todo.id}", text: "New Test Todo")
  end

  it "does not allow a user to create a todo without text" do
    visit "/"
    # TODO: Finds the new todo text field by looking for the placeholder value.
    # Probably not the best way to find it
    fill_in "New Todo", with: ""
    click_on("Add")
    visit "/"
    expect(page).not_to have_content("New Test Todo")
  end
end
