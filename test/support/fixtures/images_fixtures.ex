defmodule Identiconapi.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Identiconapi.Images` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        url: "some url"
      })
      |> Identiconapi.Images.create_image()

    image
  end
end
