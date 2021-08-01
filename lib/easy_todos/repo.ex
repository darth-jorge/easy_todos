defmodule EasyTodos.Repo do
  use Ecto.Repo,
    otp_app: :easy_todos,
    adapter: Ecto.Adapters.Postgres
end
