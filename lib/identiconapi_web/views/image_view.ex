defmodule IdenticonapiWeb.ImageView do
  use IdenticonapiWeb, :view
  alias IdenticonapiWeb.ImageView
  alias Identiconapi.Images.Manipulation

  def render("show.json", %{image: image}) do

    image = Manipulation.main(image.url)



#    render_one(image, ImageView, "image.json")
    %{url: image}

    
  end




  
end
