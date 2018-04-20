require "rails_helper"

RSpec.describe CreatesTodo do
  it "Creates a todo with a name" do
    creator = CreatesTodo.new(name: "A New Todo")
    creator.build
    expect(creator.todo.name).to eq("A New Todo")
  end

  it "Creates a todo with default due date" do
    creator = CreatesTodo.new(name: "A new Todo")
    creator.build
    expect(creator.todo.due_date).to eq(Date.today)
  end

  it "Creates a todo with a due date" do
    creator = CreatesTodo.new(name: "A new Todo", due_date: Date.today + 1.day)
    creator.build
    expect(creator.todo.due_date).to eq(Date.today + 1.day)
  end

  it "default due date is set to today when todo saved" do
    creator = CreatesTodo.new(name: "A New Todo")
    creator.create
    saved_todo =  Todo.find_by({name: "A New Todo"})
    expect(creator).to be_a_success
    expect(saved_todo.due_date).to eq(Date.today)
  end

  describe "failure cases" do
    it "fails when trying to save a todo with no name" do
      creator = CreatesTodo.new
      creator.create
      expect(creator).not_to be_a_success
    end
  end
end
