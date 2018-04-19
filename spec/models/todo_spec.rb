require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:todo) { Todo.new }

  it "is not valid without a name" do
    todo.valid?
    expect(todo.errors[:name]).to include("can't be blank")
  end

  it "is valid with a name" do
    todo.name = "stuff"
    todo.valid?
    expect(todo.errors[:name].count).to equal(0)
  end

  it "has default completed value" do
    expect(todo.completed).to equal(false)
  end

  it "set due date" do
    todo.due_date = Date.today + 2.days
    expect(todo.due_date).to eq(Date.today + 2.days)
  end
end
