defmodule Gist.Gistis.SavedGist do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "saved_gists" do

    belongs_to :user, Gist.Accounts.User
    belongs_to :gisti, Gist.Gistis.Gisti

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(saved_gist, attrs) do
    saved_gist
    |> cast(attrs, [:user_id, :gisti_id])
    |> validate_required([:user_id, :gisti_id])
  end
end
