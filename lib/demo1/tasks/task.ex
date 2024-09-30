defmodule Demo1.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :status, :string
    field :title, :string
    # field :user_id, references(:users, on_delete: :delete_all, type: :binary_id)
    # belongs_to :user, Demo1.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :status])
    |> validate_required([:title, :status])
  end
end
