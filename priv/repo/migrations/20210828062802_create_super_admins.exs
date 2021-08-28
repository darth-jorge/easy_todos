defmodule EasyTodos.Repo.Migrations.CreateSuperAdmins do
  use Ecto.Migration

  def change do
    create table(:super_admins) do
      add :full_name, :string
      add :email, :string
      add :encrypted_password, :string
      add :company, :string

      timestamps()
    end

  end
end
