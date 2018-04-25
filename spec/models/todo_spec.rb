require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:todoWithoutName) { FactoryBot.build_stubbed(:todo, name: "") }
  let(:todo) { FactoryBot.build_stubbed(:todo, name: "Thing to do") }

  it "is not valid without a name" do
    todoWithoutName.valid?
    expect(todoWithoutName.errors[:name]).to include("can't be blank")
  end

  it "is valid with a name" do
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
