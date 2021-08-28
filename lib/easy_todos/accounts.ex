defmodule EasyTodos.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias EasyTodos.Repo

  alias EasyTodos.Accounts.SuperAdmin

  @doc """
  Returns the list of super_admins.

  ## Examples

      iex> list_super_admins()
      [%SuperAdmin{}, ...]

  """
  def list_super_admins do
    Repo.all(SuperAdmin)
  end

  @doc """
  Gets a single super_admin.

  Raises `Ecto.NoResultsError` if the Super admin does not exist.

  ## Examples

      iex> get_super_admin!(123)
      %SuperAdmin{}

      iex> get_super_admin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_super_admin!(id), do: Repo.get!(SuperAdmin, id)

  @doc """
  Creates a super_admin.

  ## Examples

      iex> create_super_admin(%{field: value})
      {:ok, %SuperAdmin{}}

      iex> create_super_admin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_super_admin(attrs \\ %{}) do
    %SuperAdmin{}
    |> SuperAdmin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a super_admin.

  ## Examples

      iex> update_super_admin(super_admin, %{field: new_value})
      {:ok, %SuperAdmin{}}

      iex> update_super_admin(super_admin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_super_admin(%SuperAdmin{} = super_admin, attrs) do
    super_admin
    |> SuperAdmin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a super_admin.

  ## Examples

      iex> delete_super_admin(super_admin)
      {:ok, %SuperAdmin{}}

      iex> delete_super_admin(super_admin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_super_admin(%SuperAdmin{} = super_admin) do
    Repo.delete(super_admin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking super_admin changes.

  ## Examples

      iex> change_super_admin(super_admin)
      %Ecto.Changeset{data: %SuperAdmin{}}

  """
  def change_super_admin(%SuperAdmin{} = super_admin, attrs \\ %{}) do
    SuperAdmin.changeset(super_admin, attrs)
  end
end
