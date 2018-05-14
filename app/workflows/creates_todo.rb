class CreatesTodo
  attr_accessor :name, :due_date, :todo

  def initialize(name: "", due_date: Date.today, user: nil)
    @name = name
    @due_date = due_date
    @cur_user = user
    @success = false
  end

  def success?
    @success
  end

  def build
    self.todo = Todo.new(name: @name, due_date: @due_date, user: @cur_user)
  end

  def create
    build
    @success = todo.save
  end
end
