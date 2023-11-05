defmodule GistWeb.PageController do
  use GistWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: "/create")
  end
end
