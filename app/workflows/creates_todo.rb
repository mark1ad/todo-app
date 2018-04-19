class CreatesTodo
  attr_accessor :name, :due_date, :todo

  def initialize(name: "", due_date: Date.today)
    @name = name
    @due_date = due_date
    @success = false
  end

  def success?
    @success
  end

  def build
    self.todo = Todo.new(name: self.name, due_date: self.due_date)
  end

  def create
    build
    @success = todo.save
  end
end
