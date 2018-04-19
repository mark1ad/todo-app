class TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # POST /todos
  # POST /todos.json
  def create
    @workflow = CreatesTodo.new(
      name: params[:todo][:name]
    )
    @workflow.create
    if @workflow.success?
      flash[:notice] = "Todo created."
    else
      flash[:error] = "Error creating todo."
    end
    redirect_to :root
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    if @todo.update(todo_params)
      flash[:notice] = "Updated"
    else
      flash[:error] = "Error updating todo."
    end
    redirect_to :root
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    redirect_to :root
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:name, :completed)
    end
end
