defmodule Demo1.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo1.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        status: "some status",
        title: "some title"
      })
      |> Demo1.Tasks.create_task()

    task
  end
end
