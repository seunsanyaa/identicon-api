defmodule IdenticonapiWeb.ImageView do
  use IdenticonapiWeb, :view
  alias IdenticonapiWeb.ImageView
  alias Identiconapi.Images.Manipulation

  def render("show.json", %{image: image}) do

            imageurl = Manipulation.main(image.url)



        #    render_one(image, ImageView, "image.json")
            %{url: imageurl}

    
  end




  
end
