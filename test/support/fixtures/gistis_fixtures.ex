defmodule Gist.GistisFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gist.Gistis` context.
  """

  @doc """
  Generate a gisti.
  """
  def gisti_fixture(attrs \\ %{}) do
    {:ok, gisti} =
      attrs
      |> Enum.into(%{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name"
      })
      |> Gist.Gistis.create_gisti()

    gisti
  end

  @doc """
  Generate a saved_gist.
  """
  def saved_gist_fixture(attrs \\ %{}) do
    {:ok, saved_gist} =
      attrs
      |> Enum.into(%{

      })
      |> Gist.Gistis.create_saved_gist()

    saved_gist
  end
end
