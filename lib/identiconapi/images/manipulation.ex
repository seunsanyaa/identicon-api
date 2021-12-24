defmodule Identiconapi.Images.Manipulation do
  alias Identiconapi.Images.Pattern



    def main(input) do
      input
      |> hash_input
      |>pick_color
      |>build_grid
      |>filter_odd_squares
      |>build_pixel_map
      |>draw_image
      |>save_image(input)
    end









    def hash_input(input) do

      hex = :crypto.hash(:md5,input)
            |> :binary.bin_to_list

      %Pattern{hex: hex}

    end


    def pick_color(%Pattern{hex: [r, g, b | _tail]}= image) do



      %Pattern{image | color: {r,g,b}}


    end


    def build_grid(%Pattern{hex: hex}= image) do


      grid=
        hex
        |>Enum.chunk(3)
        |>Enum.map(&mirror_row/1)
        |>List.flatten
        |>Enum.with_index


      %Pattern{image | grid: grid}


    end

    def mirror_row([a,b | _c]= row) do

      row ++ [a,b]


#      row ++ [row[1], row[0]]






    end
#
#    def mirror_row([first,second | _tail]= row) do
#
#
#      #      row ++ [row[1], row[0]]
#       row ++ [second,first]
#
#    end


    def filter_odd_squares(image) do

      %Pattern{grid: grid}=image

      grid = Enum.filter grid, fn({code, _index})  ->

        rem(code,2) == 0

      end

      %Pattern{image | grid: grid}


    end

    def build_pixel_map(image) do

      %Pattern{grid: grid}=image
      pixel_map = Enum.map grid, fn ({code, index}) ->

        horizontal = rem(index,5) * 50
        vertical = div(index, 5) * 50


        top_left = {horizontal,vertical}
        bottom_right = {horizontal + 50, vertical + 50}

        {top_left, bottom_right}


      end

      %Pattern{image | pixel_map: pixel_map}


    end


    def draw_image( %Pattern{color: color, pixel_map: pixel_map}) do


      image = :egd.create(250, 250)
      fill = :egd.color(color)


      Enum.each pixel_map, fn({start, stop})  ->

        :egd.filledRectangle(image, start, stop, fill)


      end


      :egd.render(image)

    end



    def save_image(image, input) do
      File.write("#{input}.png",image)
    end





end
