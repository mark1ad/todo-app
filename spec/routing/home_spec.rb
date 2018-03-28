require 'rails_helper'

RSpec.describe "routing to home", :type => :routing do
  it "routes / to home#show" do
    expect(:get => "/").to route_to(
      :controller => "home",
      :action => "index"
    )
  end
end
