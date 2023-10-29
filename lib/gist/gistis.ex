defmodule Gist.Gistis do
  @moduledoc """
  The Gistis context.
  """

  import Ecto.Query, warn: false
  alias Gist.Repo

  alias Gist.Gistis.Gisti

  @doc """
  Returns the list of gistis.

  ## Examples

      iex> list_gistis()
      [%Gisti{}, ...]

  """
  def list_gistis do
    Repo.all(Gisti)
  end

  @doc """
  Gets a single gisti.

  Raises `Ecto.NoResultsError` if the Gisti does not exist.

  ## Examples

      iex> get_gisti!(123)
      %Gisti{}

      iex> get_gisti!(456)
      ** (Ecto.NoResultsError)

  """
  def get_gisti!(id), do: Repo.get!(Gisti, id)

  @doc """
  Creates a gisti.

  ## Examples

      iex> create_gisti(%{field: value})
      {:ok, %Gisti{}}

      iex> create_gisti(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_gisti(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:gistis)
    |> Gisti.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a gisti.

  ## Examples

      iex> update_gisti(gisti, %{field: new_value})
      {:ok, %Gisti{}}

      iex> update_gisti(gisti, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_gisti(%Gisti{} = gisti, attrs) do
    gisti
    |> Gisti.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a gisti.

  ## Examples

      iex> delete_gisti(gisti)
      {:ok, %Gisti{}}

      iex> delete_gisti(gisti)
      {:error, %Ecto.Changeset{}}

  """
  def delete_gisti(%Gisti{} = gisti) do
    Repo.delete(gisti)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking gisti changes.

  ## Examples

      iex> change_gisti(gisti)
      %Ecto.Changeset{data: %Gisti{}}

  """
  def change_gisti(%Gisti{} = gisti, attrs \\ %{}) do
    Gisti.changeset(gisti, attrs)
  end

  alias Gist.Gistis.SavedGist

  @doc """
  Returns the list of saved_gists.

  ## Examples

      iex> list_saved_gists()
      [%SavedGist{}, ...]

  """
  def list_saved_gists do
    Repo.all(SavedGist)
  end

  @doc """
  Gets a single saved_gist.

  Raises `Ecto.NoResultsError` if the Saved gist does not exist.

  ## Examples

      iex> get_saved_gist!(123)
      %SavedGist{}

      iex> get_saved_gist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_saved_gist!(id), do: Repo.get!(SavedGist, id)

  @doc """
  Creates a saved_gist.

  ## Examples

      iex> create_saved_gist(%{field: value})
      {:ok, %SavedGist{}}

      iex> create_saved_gist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_saved_gist(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:saved_gists)
    |> SavedGist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a saved_gist.

  ## Examples

      iex> update_saved_gist(saved_gist, %{field: new_value})
      {:ok, %SavedGist{}}

      iex> update_saved_gist(saved_gist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_saved_gist(%SavedGist{} = saved_gist, attrs) do
    saved_gist
    |> SavedGist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a saved_gist.

  ## Examples

      iex> delete_saved_gist(saved_gist)
      {:ok, %SavedGist{}}

      iex> delete_saved_gist(saved_gist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_saved_gist(%SavedGist{} = saved_gist) do
    Repo.delete(saved_gist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking saved_gist changes.

  ## Examples

      iex> change_saved_gist(saved_gist)
      %Ecto.Changeset{data: %SavedGist{}}

  """
  def change_saved_gist(%SavedGist{} = saved_gist, attrs \\ %{}) do
    SavedGist.changeset(saved_gist, attrs)
  end
end
