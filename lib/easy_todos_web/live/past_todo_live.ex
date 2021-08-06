defmodule EasyTodosWeb.PastTodoLive do
  use EasyTodosWeb, :live_view

  alias EasyTodos.Todos

  def mount(_params, _session, socket) do
    Todos.subscribe()

    {:ok, fetch(socket)}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    todo = Todos.get_todo!(id)
    Todos.delete_todo(todo)

    {:noreply, fetch(socket)}
  end

  def handle_info({Todos, [:todo | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    past_todos = Todos.list_past_todos()

    assign(socket, past_todos: past_todos)
  end
end
