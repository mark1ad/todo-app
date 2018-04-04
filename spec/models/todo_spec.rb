require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "is not valid without a todo" do
    todo = Todo.new
    todo.valid?
    expect(todo.errors[:todo]).to include("can't be blank")
  end

  it "is valid with a todo" do
    todo = Todo.new({todo: "stuff"})
    todo.valid?
    expect(todo.errors[:todo].count).to equal(0)
  end

  it "has default completed value" do
    todo = Todo.new
    expect(todo.completed).to equal(false)
  end
end
