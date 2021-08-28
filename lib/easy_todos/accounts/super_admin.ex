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
    |> validate_required([:email])
    |> unique_constraint(:email)
    |> encrypt_password()
  end

  defp encrypt_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :encrypted_password, Comeonin.Bcrypt.hashpwsalt(password))

      _ ->
        changeset
    end
  end
end
