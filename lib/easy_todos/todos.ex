defmodule EasyTodos.Todos do
  @moduledoc """
  The Todos context.
  """
  use Timex

  import Ecto.Query, warn: false
  alias EasyTodos.Repo

  alias EasyTodos.Todos.Todo

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%Todo{}, ...]

  """
  def list_todos do
    Repo.all(Todo)
  end

  def list_past_todos do
    query =
      from(t in Todo,
        where: t.date < ^Timex.now()
      )

    query
    |> Repo.all()
  end

  def list_future_todos do
    query =
      from(t in Todo,
        where: t.date > ^Timex.now()
      )

    query
    |> Repo.all()
  end

  def list_completed_todos do
    query =
      from(t in Todo,
        where: t.done == true,
        where: t.date == ^Timex.today()
      )

    query
    |> Repo.all()
  end

  def list_incompleted_todos do
    query =
      from(t in Todo,
        where: t.done == false,
        where: t.date == ^Timex.today()
      )

    query
    |> Repo.all()
  end

  @doc """
  Gets a single todo.

  Raises `Ecto.NoResultsError` if the Todo does not exist.

  ## Examples

      iex> get_todo!(123)
      %Todo{}

      iex> get_todo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo!(id), do: Repo.get!(Todo, id)

  @doc """
  Creates a todo.

  ## Examples

      iex> create_todo(%{field: value})
      {:ok, %Todo{}}

      iex> create_todo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo(attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Repo.insert()
    |> broadcast_change([:todo, :created])
  end

  @doc """
  Updates a todo.

  ## Examples

      iex> update_todo(todo, %{field: new_value})
      {:ok, %Todo{}}

      iex> update_todo(todo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo(%Todo{} = todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
    |> broadcast_change([:todo, :updated])
  end

  @doc """
  Deletes a todo.

  ## Examples

      iex> delete_todo(todo)
      {:ok, %Todo{}}

      iex> delete_todo(todo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo(%Todo{} = todo) do
    Repo.delete(todo)
    |> broadcast_change([:todo, :deleted])
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo changes.

  ## Examples

      iex> change_todo(todo)
      %Ecto.Changeset{data: %Todo{}}

  """
  def change_todo(%Todo{} = todo, attrs \\ %{}) do
    Todo.changeset(todo, attrs)
  end


  @topic inspect(__MODULE__)

  def subscribe() do
    Phoenix.PubSub.subscribe(EasyTodos.PubSub, @topic)
  end

  def broadcast_change({:ok, result}, event) do
    Phoenix.PubSub.broadcast(EasyTodos.PubSub, @topic, {__MODULE__, event, result})

    {:ok, result}
  end
end
