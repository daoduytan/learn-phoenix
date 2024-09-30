defmodule Demo1.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo1.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        completed: true,
        title: "some title"
      })
      |> Demo1.Todos.create_todo()

    todo
  end
end
