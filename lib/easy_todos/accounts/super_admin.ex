defmodule EasyTodos.Accounts.SuperAdmin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "super_admins" do
    field :company, :string
    field :email, :string
    field :encrypted_password, :string
    field :full_name, :string

    timestamps()
  end

  @doc false
  def changeset(super_admin, attrs) do
    super_admin
    |> cast(attrs, [:full_name, :email, :encrypted_password, :company])
    |> validate_required([:full_name, :email, :encrypted_password, :company])
  end
end
