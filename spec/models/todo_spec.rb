require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "missing todo field" do
    todo = Todo.new
    todo.valid?
    expect(todo.errors[:todo]).to include("can't be blank")
  end

  it "presence of todo field" do
    todo = Todo.new({todo: "stuff"})
    todo.valid?
    expect(todo.errors[:todo].count).to equal(0)
  end

  it "default completed value" do
    todo = Todo.new
    expect(todo.completed).to equal(false)
  end
end
