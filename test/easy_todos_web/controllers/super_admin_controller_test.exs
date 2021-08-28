defmodule EasyTodosWeb.SuperAdminControllerTest do
  use EasyTodosWeb.ConnCase

  alias EasyTodos.Accounts

  @create_attrs %{company: "some company", email: "some email", encrypted_password: "some encrypted_password", full_name: "some full_name"}
  @update_attrs %{company: "some updated company", email: "some updated email", encrypted_password: "some updated encrypted_password", full_name: "some updated full_name"}
  @invalid_attrs %{company: nil, email: nil, encrypted_password: nil, full_name: nil}

  def fixture(:super_admin) do
    {:ok, super_admin} = Accounts.create_super_admin(@create_attrs)
    super_admin
  end

  describe "index" do
    test "lists all super_admins", %{conn: conn} do
      conn = get(conn, Routes.super_admin_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Super admins"
    end
  end

  describe "new super_admin" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.super_admin_path(conn, :new))
      assert html_response(conn, 200) =~ "New Super admin"
    end
  end

  describe "create super_admin" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.super_admin_path(conn, :create), super_admin: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.super_admin_path(conn, :show, id)

      conn = get(conn, Routes.super_admin_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Super admin"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.super_admin_path(conn, :create), super_admin: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Super admin"
    end
  end

  describe "edit super_admin" do
    setup [:create_super_admin]

    test "renders form for editing chosen super_admin", %{conn: conn, super_admin: super_admin} do
      conn = get(conn, Routes.super_admin_path(conn, :edit, super_admin))
      assert html_response(conn, 200) =~ "Edit Super admin"
    end
  end

  describe "update super_admin" do
    setup [:create_super_admin]

    test "redirects when data is valid", %{conn: conn, super_admin: super_admin} do
      conn = put(conn, Routes.super_admin_path(conn, :update, super_admin), super_admin: @update_attrs)
      assert redirected_to(conn) == Routes.super_admin_path(conn, :show, super_admin)

      conn = get(conn, Routes.super_admin_path(conn, :show, super_admin))
      assert html_response(conn, 200) =~ "some updated company"
    end

    test "renders errors when data is invalid", %{conn: conn, super_admin: super_admin} do
      conn = put(conn, Routes.super_admin_path(conn, :update, super_admin), super_admin: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Super admin"
    end
  end

  describe "delete super_admin" do
    setup [:create_super_admin]

    test "deletes chosen super_admin", %{conn: conn, super_admin: super_admin} do
      conn = delete(conn, Routes.super_admin_path(conn, :delete, super_admin))
      assert redirected_to(conn) == Routes.super_admin_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.super_admin_path(conn, :show, super_admin))
      end
    end
  end

  defp create_super_admin(_) do
    super_admin = fixture(:super_admin)
    %{super_admin: super_admin}
  end
end
