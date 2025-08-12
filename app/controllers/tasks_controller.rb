class TasksController < ApplicationController
  # "/tasks"
  def index
    @tasks = Task.all
  end

  # "/tasks/1"
  def show
    @task = Task.find(params[:id])
    @complete = @task[:completed]

    if @complete
      @completed = "✅ Task is complete!"
    else
      @completed = "❌ Task is Not complete!"
    end
  end

  # "/tasks/new"
  def new
    @task = Task.new
  end

  # to get to this action, I have to submit a form -> post /restaurants
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
