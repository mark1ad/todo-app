require 'rails_helper'

RSpec.describe "routing to todos", :type => :routing do
  it "does not expose a list of todos" do
    expect(:get => "/todos").not_to be_routable
  end

  it "does not expose show todo" do
    expect(:get => "/todos/1").not_to be_routable
  end

  it "does not expose edit" do
    expect(:get => "/todos/1/edit").not_to be_routable
  end

  it "does not expose new" do
    expect(:get => "/todos/new").not_to be_routable
  end
end
