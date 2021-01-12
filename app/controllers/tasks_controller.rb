class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # 画面をスムーズに描画するために、新しいtaskオブジェクト生成
    # アクションからビューに受け渡しをしたいデータをインスタンス変数に入れる
    # 返す画面を省略した場合、アクション名に対応する場面を返す
    # 今回の様に省略した場合、 app/views/tasks/new.html.slim が返される
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました"
  end

  def create
    task = Task.new(task_params)
    task.save!
    # Flashメッセージ
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました"
    # 以下と同じ意味
    # flash[:notice] = "タスク「#{task.name}」を登録しました"
    # redirect_to tasks_url
  end

  private
  # Strong Parameters
  # フォームからリクエストパラメータとして送られてきた情報から以下の役割をする
  # 想定通りの形であることを確認
  # 受け取る想定である情報(name,description)だけを抜き取る
  # 不正なデータの登録や更新を防ぐ
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
