defmodule RefPA2Web.PageController do
  use RefPA2Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
