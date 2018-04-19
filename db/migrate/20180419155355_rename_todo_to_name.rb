class RenameTodoToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :todos, :todo, :name
  end
end
