class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
    # 画面をスムーズに描画するために、新しいtaskオブジェクト生成
    # アクションからビューに受け渡しをしたいデータをインスタンス変数に入れる
    # 返す画面を省略した場合、アクション名に対応する場面を返す
    # 今回の様に省略した場合、 app/views/tasks/new.html.slim が返される
    @task = Task.new
  end

  def edit
  end
end
