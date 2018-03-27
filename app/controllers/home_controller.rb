class HomeController < ApplicationController
  def index
    @todo = Todo.new
  end
end
