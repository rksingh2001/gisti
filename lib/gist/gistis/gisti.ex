defmodule Gist.Gistis.Gisti do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "gistis" do
    field :name, :string
    field :description, :string
    field :markup_text, :string
    belongs_to :user, Gist.Accounts.User
    has_many :comments, Gist.Comments.Comment

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(gisti, attrs) do
    gisti
    |> cast(attrs, [:name, :description, :markup_text, :user_id])
    |> validate_required([:name, :description, :markup_text, :user_id])
  end
end
