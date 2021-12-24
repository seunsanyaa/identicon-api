defmodule IdenticonapiWeb.ImageController do
  use IdenticonapiWeb, :controller

  alias Identiconapi.Images





#  def index(conn, _params) do
#    render(conn, "index.html")
#  end


  def create(conn, %{"url" => url} = params) do
    {:ok, image} = Images.create_image(params)


    conn
    |> put_status(201)
#    |> Identiconapi.Images.Manipulation.main()
    |> render("show.json", %{image: image})






  end

#
#  def main(input) do
#    input
#    |> hash_input
#    |>pick_color
#    |>build_grid
#    |>filter_odd_squares
#    |>build_pixel_map
#    |>draw_image
#    |>save_image(input)
#  end
#
#
#
#
#
#
#
#
#
#  def hash_input(input) do
#
#    hex = :crypto.hash(:md5,input)
#          |> :binary.bin_to_list
#
#    %Identiconapi.Images{hex: hex}
#
#  end
#
#
#  def pick_color(image) do
#
#    %Identiconapi.Images{hex: [r, g, b | _tail]}=image
#
#    %Identiconapi.Images{image | color: {r,g,b}}
#
#
#  end
#
#
#  def build_grid(image) do
#    %Identiconapi.Images{hex: hex}= image
#
#    grid=
#      hex
#      |>Enum.chunk(3)
#      |>Enum.map(&mirror_row/1)
#      |>List.flatten
#      |>Enum.with_index
#
#
#    %Identiconapi.Images{image | grid: grid}
#
#
#  end
#
#  def mirror_row(row) do
#
#    [first,second | _tail]= row
#
#    row ++ [second,first]
#  end
#
#
#  def filter_odd_squares(image) do
#
#    %Identiconapi.Images{grid: grid}=image
#
#    grid = Enum.filter grid, fn({code, _index})  ->
#
#      rem(code,2) == 0
#
#    end
#
#    %Identiconapi.Images{image | grid: grid}
#
#
#  end
#
#  def build_pixel_map(image) do
#
#    %Identiconapi.Images{grid: grid}=image
#    pixel_map = Enum.map grid, fn ({code, index}) ->
#
#      horizontal = rem(index,5) * 50
#      vertical = div(index, 5) * 50
#
#
#      top_left = {horizontal,vertical}
#      bottom_right = {horizontal + 50, vertical + 50}
#
#      {top_left, bottom_right}
#
#
#    end
#
#    %Identiconapi.Images{image | pixel_map: pixel_map}
#
#
#  end
#
#
#  def draw_image( %Identiconapi.Images{color: color, pixel_map: pixel_map}) do
#
#
#    image = :egd.create(250, 250)
#    fill = :egd.color(color)
#
#
#    Enum.each pixel_map, fn({start, stop})  ->
#
#      :egd.filledRectangle(image, start, stop, fill)
#
#
#    end
#
#
#    :egd.render(image)
#
#  end
#
#
#
#  def save_image(image, input) do
#    File.write("#{input}.png",image)
#  end


end
