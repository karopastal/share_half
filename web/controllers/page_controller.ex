defmodule ShareHalf.PageController do
  use ShareHalf.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
