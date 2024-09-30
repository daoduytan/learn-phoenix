defmodule Demo1Web.TaskLive.TaskFormComponent do
  alias Demo1.Tasks
  use Demo1Web, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div>Hello</div>

      <.simple_form
        for={@form}
        id="todo-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:completed]} type="checkbox" label="Completed" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Todo</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{task: task} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Tasks.change_task(task))
     end)}
  end
end
