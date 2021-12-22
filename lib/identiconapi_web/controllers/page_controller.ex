defmodule IdenticonapiWeb.PageController do
  use IdenticonapiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
