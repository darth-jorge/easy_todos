defmodule EasyTodos.Repo.Migrations.AddTimeFieldToTodoTable do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :date, :naive_datetime
    end
  end
end
