defmodule EasyTodos.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :description, :string
    field :done, :boolean, default: false
    field :title, :string
    field :date, :date
    field :deleted_at, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :description, :done, :date])
    |> validate_required([:title,])
  end

  def remove_changeset(todo, attrs) do
    todo
    |> cast(attrs, [:deleted_at])
    |> validate_required([:deleted_at])
  end
end
