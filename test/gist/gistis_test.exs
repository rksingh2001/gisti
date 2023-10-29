defmodule Gist.GistisTest do
  use Gist.DataCase

  alias Gist.Gistis

  describe "gistis" do
    alias Gist.Gistis.Gisti

    import Gist.GistisFixtures

    @invalid_attrs %{name: nil, description: nil, markup_text: nil}

    test "list_gistis/0 returns all gistis" do
      gisti = gisti_fixture()
      assert Gistis.list_gistis() == [gisti]
    end

    test "get_gisti!/1 returns the gisti with given id" do
      gisti = gisti_fixture()
      assert Gistis.get_gisti!(gisti.id) == gisti
    end

    test "create_gisti/1 with valid data creates a gisti" do
      valid_attrs = %{name: "some name", description: "some description", markup_text: "some markup_text"}

      assert {:ok, %Gisti{} = gisti} = Gistis.create_gisti(valid_attrs)
      assert gisti.name == "some name"
      assert gisti.description == "some description"
      assert gisti.markup_text == "some markup_text"
    end

    test "create_gisti/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gistis.create_gisti(@invalid_attrs)
    end

    test "update_gisti/2 with valid data updates the gisti" do
      gisti = gisti_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", markup_text: "some updated markup_text"}

      assert {:ok, %Gisti{} = gisti} = Gistis.update_gisti(gisti, update_attrs)
      assert gisti.name == "some updated name"
      assert gisti.description == "some updated description"
      assert gisti.markup_text == "some updated markup_text"
    end

    test "update_gisti/2 with invalid data returns error changeset" do
      gisti = gisti_fixture()
      assert {:error, %Ecto.Changeset{}} = Gistis.update_gisti(gisti, @invalid_attrs)
      assert gisti == Gistis.get_gisti!(gisti.id)
    end

    test "delete_gisti/1 deletes the gisti" do
      gisti = gisti_fixture()
      assert {:ok, %Gisti{}} = Gistis.delete_gisti(gisti)
      assert_raise Ecto.NoResultsError, fn -> Gistis.get_gisti!(gisti.id) end
    end

    test "change_gisti/1 returns a gisti changeset" do
      gisti = gisti_fixture()
      assert %Ecto.Changeset{} = Gistis.change_gisti(gisti)
    end
  end

  describe "saved_gists" do
    alias Gist.Gistis.SavedGist

    import Gist.GistisFixtures

    @invalid_attrs %{}

    test "list_saved_gists/0 returns all saved_gists" do
      saved_gist = saved_gist_fixture()
      assert Gistis.list_saved_gists() == [saved_gist]
    end

    test "get_saved_gist!/1 returns the saved_gist with given id" do
      saved_gist = saved_gist_fixture()
      assert Gistis.get_saved_gist!(saved_gist.id) == saved_gist
    end

    test "create_saved_gist/1 with valid data creates a saved_gist" do
      valid_attrs = %{}

      assert {:ok, %SavedGist{} = saved_gist} = Gistis.create_saved_gist(valid_attrs)
    end

    test "create_saved_gist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gistis.create_saved_gist(@invalid_attrs)
    end

    test "update_saved_gist/2 with valid data updates the saved_gist" do
      saved_gist = saved_gist_fixture()
      update_attrs = %{}

      assert {:ok, %SavedGist{} = saved_gist} = Gistis.update_saved_gist(saved_gist, update_attrs)
    end

    test "update_saved_gist/2 with invalid data returns error changeset" do
      saved_gist = saved_gist_fixture()
      assert {:error, %Ecto.Changeset{}} = Gistis.update_saved_gist(saved_gist, @invalid_attrs)
      assert saved_gist == Gistis.get_saved_gist!(saved_gist.id)
    end

    test "delete_saved_gist/1 deletes the saved_gist" do
      saved_gist = saved_gist_fixture()
      assert {:ok, %SavedGist{}} = Gistis.delete_saved_gist(saved_gist)
      assert_raise Ecto.NoResultsError, fn -> Gistis.get_saved_gist!(saved_gist.id) end
    end

    test "change_saved_gist/1 returns a saved_gist changeset" do
      saved_gist = saved_gist_fixture()
      assert %Ecto.Changeset{} = Gistis.change_saved_gist(saved_gist)
    end
  end
end
