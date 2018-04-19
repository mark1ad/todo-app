require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "is not valid without a name" do
    todo = Todo.new
    todo.valid?
    expect(todo.errors[:name]).to include("can't be blank")
  end

  it "is valid with a name" do
    todo = Todo.new({name: "stuff"})
    todo.valid?
    expect(todo.errors[:name].count).to equal(0)
  end

  it "has default completed value" do
    todo = Todo.new
    expect(todo.completed).to equal(false)
  end
end
