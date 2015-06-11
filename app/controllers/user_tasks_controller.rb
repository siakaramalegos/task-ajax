class UserTasksController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update, :destroy]
  before_action :set_user_task, only: [:show, :edit, :update, :destroy]

  # GET /user_tasks/new
  def new
    @user_task = UserTask.new
  end

  # POST /user_tasks
  # POST /user_tasks.json
  def create
    @user_task = UserTask.create(user_task_params)
  end

  # PATCH/PUT /user_tasks/1
  # PATCH/PUT /user_tasks/1.json
  def update
    respond_to do |format|
      if @user_task.update(user_task_params)
        format.html { redirect_to @user_task, notice: 'User task was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_task }
      else
        format.html { render :edit }
        format.json { render json: @user_task.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def all_tasks
      @user_tasks = UserTask.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_task
      @user_task = UserTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_task_params
      params.require(:user_task).permit(:description, :due)
    end
end
