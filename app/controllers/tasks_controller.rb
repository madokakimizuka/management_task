class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  PER = 8

  def index
    if params[:task].present? && params[:task][:search]
      @search = params[:task]
      @enums = Task.statuses
      @labelings = Labeling.where(label_id: @search[:label_key]).pluck(:task_id)
      @tasks = current_user.tasks.title_search(@search[:title_key]).status_search(@enums[@search[:status_key]])
      @tasks = @labelings.length == 0 ? @tasks.paginate(params) : @tasks.where(id: @labelings).paginate(params)

      # 送られてきた :label_key をもつデータを中間テーブルから where で検索して、pluck でデータの :task_id を抽出
      # Labeling.where(label_id: params[:task][:label_key] ).pluck(:task_id)
      # 抽出した :task_id と一致する :id をもつ Task を取得したい

      # @tasks = Task.where(('title LIKE ? AND CAST(status AS TEXT) LIKE ?'),"%#{ @search[:title_key] }%", "%#{ @enums[@search[:status_key]] }%")
      # (status = ?) で検索すると、status_searchが未選択の時にデータ型が合わない、みたいに怒られる。
      # 文字にしたものを数値で取り出し直して、また文字に戻してる。
    else
      @tasks = current_user.tasks.sort_from_params(params).paginate(params)
    end
    # 終了期限でソートする
    # Serviceクラスを利用したコード
    # @tasks = TaskIndexService.new(params).run
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to task_path(@task.id), notice:"タスクを作成しました!"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "タスクを編集しました!"
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice:"タスクを削除しました!"
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :priority, :status, label_ids:[])
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

end
