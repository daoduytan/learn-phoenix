defmodule Demo1Web.TaskLive.Index do
  use Demo1Web, :live_view

  alias Demo1.Tasks
  alias Demo1.Tasks.Task

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :tasks, Tasks.list_tasks())}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Task")
    |> assign(:task, nil)
  end

  # defp apply_action(socket, :new, _params) do
  #   socket
  #   |> assign(:page_title, "New Task")
  #   |> assign(:task, %Task{})
  # end
end
