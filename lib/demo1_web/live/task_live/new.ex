defmodule Demo1Web.TaskLive.New do
  use Demo1Web, :live_view

  alias Demo1.Tasks
  alias Demo1.Tasks.Task

  @impl true
  def mount(params, session, socket) do
    {:ok, stream(socket, :tasks, Tasks.list_tasks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Task")
    |> assign(:task, %Task{})
  end

  @impl true
  def handle_info({Demo1Web.TaskLive.TaskFormComponent, {:saved, task}}, socket) do
    {:noreply, stream_insert(socket, :tasks, task)}
  end
end
