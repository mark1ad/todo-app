class AddDueDateToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :due_date, :date, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
