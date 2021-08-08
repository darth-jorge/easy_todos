defmodule EasyTodosWeb.TodosController do
  use EasyTodosWeb, :controller

  alias EasyTodos.Todos

  def index_deleted(conn, _params) do
    deleted_todos = Todos.list_todos()
    render(conn, :index_deleted, deleted_todos: deleted_todos)
  end
end
