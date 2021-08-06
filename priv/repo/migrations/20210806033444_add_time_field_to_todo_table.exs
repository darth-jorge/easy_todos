defmodule EasyTodos.Repo.Migrations.AddTimeFieldToTodoTable do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :date, :date, default: fragment("current_date")
    end
  end
end
