defmodule EasyTodosWeb.SuperAdminController do
  use EasyTodosWeb, :controller

  alias EasyTodos.Accounts
  alias EasyTodos.Accounts.SuperAdmin

  def index(conn, _params) do
    super_admins = Accounts.list_super_admins()
    render(conn, "index.html", super_admins: super_admins)
  end

  def new(conn, _params) do
    changeset = Accounts.change_super_admin(%SuperAdmin{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"super_admin" => super_admin_params}) do
    case Accounts.create_super_admin(super_admin_params) do
      {:ok, super_admin} ->
        conn
        |> put_flash(:info, "Super admin created successfully.")
        |> redirect(to: Routes.super_admin_path(conn, :show, super_admin))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    super_admin = Accounts.get_super_admin!(id)
    render(conn, "show.html", super_admin: super_admin)
  end

  def edit(conn, %{"id" => id}) do
    super_admin = Accounts.get_super_admin!(id)
    changeset = Accounts.change_super_admin(super_admin)
    render(conn, "edit.html", super_admin: super_admin, changeset: changeset)
  end

  def update(conn, %{"id" => id, "super_admin" => super_admin_params}) do
    super_admin = Accounts.get_super_admin!(id)

    case Accounts.update_super_admin(super_admin, super_admin_params) do
      {:ok, super_admin} ->
        conn
        |> put_flash(:info, "Super admin updated successfully.")
        |> redirect(to: Routes.super_admin_path(conn, :show, super_admin))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", super_admin: super_admin, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    super_admin = Accounts.get_super_admin!(id)
    {:ok, _super_admin} = Accounts.delete_super_admin(super_admin)

    conn
    |> put_flash(:info, "Super admin deleted successfully.")
    |> redirect(to: Routes.super_admin_path(conn, :index))
  end
end
