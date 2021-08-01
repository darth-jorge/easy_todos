defmodule EasyTodosWeb.ErrorViewTest do
  use EasyTodosWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(EasyTodosWeb.ErrorView, "404.html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(EasyTodosWeb.ErrorView, "500.html", []) == "Internal Server Error"
  end
end
