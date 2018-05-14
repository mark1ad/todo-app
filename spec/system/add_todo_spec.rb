require "rails_helper"
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe "End-to-end tests", type: :system do
  before do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  after(:each) do
    Warden.test_reset!
  end

  describe "adding a todo" do
    it "allows a user to create a todo" do
      visit root_path
      fill_in "todo[name]", with: "Todo 1"
      click_on("Add")
      visit root_path
      @todo = Todo.find_by(name: "Todo 1")
      expect(page).to have_selector("#todo_#{@todo.id} .todo-name", text: "Todo 1")
    end

    it "does not allow a user to create a todo without name" do
      visit root_path
      fill_in "todo[name]", with: ""
      click_on("Add")
      visit root_path
      # There should be no todos on page therefore no object with a
      # class="todo-name"
      expect(page).not_to have_selector(".todo-name")
    end

    it "allows a user to create a todo with a default due date" do
      visit root_path
      fill_in "todo[name]", with: "A New Todo"
      click_on("Add")
      visit root_path
      @todo = Todo.find_by(name: "A New Todo")
      expect(page).to have_selector("#todo_#{@todo.id} .todo-due-date",
        text: Date.today.strftime("%m/%d/%y"))
    end

    it "allows a user to create a todo with a due date" do
      visit root_path
      fill_in "todo[name]", with: "A New Todo"
      @due_date = Date.today + 1.day
      fill_in "todo[due_date]", with: @due_date
      click_on("Add")
      visit root_path
      @todo = Todo.find_by(name: "A New Todo")
      expect(page).to have_selector("#todo_#{@todo.id} .todo-due-date",
        text: @due_date.strftime("%m/%d/%y"))
    end
  end

  xit "allows a user to delete a todo" do
    pending "not implemented yet"
    # Create the todo
    visit root_path
    fill_in "todo[name]", with: "Todo 1"
    click_on("Add")
    visit root_path

    # Click the delete link
    @todo = Todo.find_by(name: "Todo 1")
    # TODO: Getting
    # Capybara::NotSupportedByDriverError:
    #   Capybara::Driver::Base#accept_modal
    # Can't find fix
    accept_confirm do
      click_link("todo-delete-#{@todo.id}")
    end
  end

  xit "allows a user to complete a todo" do
    # Create the todo
    visit root_path
    fill_in "todo[name]", with: "Todo 1"
    click_on("Add")
    visit root_path

    # complete todo
    # TODO: Can't get form to submit
    @todo = Todo.find_by(name: "Todo 1")
    @completed_checkbox = find("#todo_completed_#{@todo.id}")
    check("todo_completed_#{@todo.id}")
    execute_script("$('form#todo_form_#{@todo.id}').submit()")
    visit root_path
    expect(page.find("#todo_completed_#{@todo.id}")).to be_checked
  end

  it "todo is not complete" do
    # Create the todo
    visit root_path
    fill_in "todo[name]", with: "Todo 1"
    click_on("Add")
    visit root_path
    @todo = Todo.find_by(name: "Todo 1")
    expect(page.find("#todo_completed_#{@todo.id}")).not_to be_checked
  end
end
