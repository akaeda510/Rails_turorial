class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        @tasks = Task.all
        @index_title = 'タスク一覧'
    end

    def show
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            redirect_to @task, notice: 'タスクの新規登録に成功しました'
        else
            render :new
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @task.update(task_params)
                format.html { redirect_to task_url(@task), notice: "タスクの更新に成功しました"}
                format.json { render :show, status: :ok, location: @task}
            end
        end
    end

    def destroy
        @task.destroy

        respond_to do |format|
            format.html { redirect_to tasks_url}
            format.json { head :no_content}
        end
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :description, :due_date)
    end

end
