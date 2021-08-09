defmodule EasyTodos.Repo.Migrations.AddSoftDeleteFieldForTodos do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :deleted_at, :naive_datetime
    end
  end
end
