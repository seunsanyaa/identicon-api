defmodule IdenticonapiWeb.ImageView do
  use IdenticonapiWeb, :view
  alias IdenticonapiWeb.ImageView

  def render("show.json", %{image: image}) do

    render_one(image, ImageView, "image.json")
    
  end

  def render("image.json", %{image: image}) do

    %{url: image.url}




  end


  
end
