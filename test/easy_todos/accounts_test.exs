defmodule EasyTodos.AccountsTest do
  use EasyTodos.DataCase

  alias EasyTodos.Accounts

  describe "super_admins" do
    alias EasyTodos.Accounts.SuperAdmin

    @valid_attrs %{company: "some company", email: "some email", encrypted_password: "some encrypted_password", full_name: "some full_name"}
    @update_attrs %{company: "some updated company", email: "some updated email", encrypted_password: "some updated encrypted_password", full_name: "some updated full_name"}
    @invalid_attrs %{company: nil, email: nil, encrypted_password: nil, full_name: nil}

    def super_admin_fixture(attrs \\ %{}) do
      {:ok, super_admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_super_admin()

      super_admin
    end

    test "list_super_admins/0 returns all super_admins" do
      super_admin = super_admin_fixture()
      assert Accounts.list_super_admins() == [super_admin]
    end

    test "get_super_admin!/1 returns the super_admin with given id" do
      super_admin = super_admin_fixture()
      assert Accounts.get_super_admin!(super_admin.id) == super_admin
    end

    test "create_super_admin/1 with valid data creates a super_admin" do
      assert {:ok, %SuperAdmin{} = super_admin} = Accounts.create_super_admin(@valid_attrs)
      assert super_admin.company == "some company"
      assert super_admin.email == "some email"
      assert super_admin.encrypted_password == "some encrypted_password"
      assert super_admin.full_name == "some full_name"
    end

    test "create_super_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_super_admin(@invalid_attrs)
    end

    test "update_super_admin/2 with valid data updates the super_admin" do
      super_admin = super_admin_fixture()
      assert {:ok, %SuperAdmin{} = super_admin} = Accounts.update_super_admin(super_admin, @update_attrs)
      assert super_admin.company == "some updated company"
      assert super_admin.email == "some updated email"
      assert super_admin.encrypted_password == "some updated encrypted_password"
      assert super_admin.full_name == "some updated full_name"
    end

    test "update_super_admin/2 with invalid data returns error changeset" do
      super_admin = super_admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_super_admin(super_admin, @invalid_attrs)
      assert super_admin == Accounts.get_super_admin!(super_admin.id)
    end

    test "delete_super_admin/1 deletes the super_admin" do
      super_admin = super_admin_fixture()
      assert {:ok, %SuperAdmin{}} = Accounts.delete_super_admin(super_admin)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_super_admin!(super_admin.id) end
    end

    test "change_super_admin/1 returns a super_admin changeset" do
      super_admin = super_admin_fixture()
      assert %Ecto.Changeset{} = Accounts.change_super_admin(super_admin)
    end
  end
end
