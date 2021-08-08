defmodule EasyTodos.Utils do
  import Ecto.Query, warn: false
  alias EasyTodos.Repo

  def not_removed(query), do: query |> where([q], is_nil(q.deleted_at))
  def removed(query), do: query |> where([q], not is_nil(q.deleted_at))
  def latest(query), do: query |> order_by([q], desc: q.inserted_at)

  def get_all(query, type \\ :all, options \\ [])
  def get_all(query, :all, _), do: Repo.all(query)

  def get_one(query), do: Repo.one(query)
  def get_by_id(query, id), do: Repo.get(query, id)  
end
