defmodule RefPA2Web.PageControllerTest do
  use RefPA2Web.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Hello."
  end
end
