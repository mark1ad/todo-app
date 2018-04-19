class CreatesTodo
  attr_accessor :name, :due_date, :todo

  def initialize(name: "", due_date: Date.today)
    @name = name
    @due_date = due_date
  end

  def build
    self.todo = Todo.new(name: self.name, due_date: self.due_date)
  end

  def create
    build
    todo.save
  end
end
