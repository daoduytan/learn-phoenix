defmodule Demo1.Tasks do
  import Ecto.Query, warn: false

  alias Demo1.Repo
  alias Demo1.Tasks.Task

  def list_tasks do
    Repo.all(Task)
  end

  def change_task(%Task{} = task, attrs \\ %{}) do
    Task.changeset(task, attrs)
  end
end
