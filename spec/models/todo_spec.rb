require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe Todo, type: :model do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  after(:each) do
    Warden.test_reset!
  end

  let(:todoWithoutName) { FactoryBot.build_stubbed(:todo, name: "", user: @user) }
  let(:todo) { FactoryBot.build_stubbed(:todo, name: "Thing to do", user: @user) }
  let(:todoWithoutUser) { FactoryBot.build_stubbed(:todo, name: "Thing to do") }

  it "is not valid without user" do
    todoWithoutUser.valid?
    expect(todoWithoutUser.errors[:user]).to include("can't be blank")
  end

  it "is valid with user" do
    todo.valid?
    expect(todo.errors[:user].count).to equal(0)
  end

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
