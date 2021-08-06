defmodule EasyTodosWeb.PastTodoLive do
  use EasyTodosWeb, :live_view

  alias EasyTodos.Todos

  def mount(_params, _session, socket) do
    Todos.subscribe()

    {:ok, fetch(socket)}
  end

  def handle_info({Todos, [:todo | _], _}, socket) do
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    past_todos = Todos.list_incompleted_todos()

    assign(socket, ctodos: past_todos)
  end
end
