defmodule Identiconapi.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
