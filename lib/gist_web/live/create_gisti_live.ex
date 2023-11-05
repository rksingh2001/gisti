defmodule GistWeb.CreateGistiLive do
  use GistWeb, :live_view
  import Phoenix.HTML.Form
  alias Gist.{Gistis, Gistis.Gisti}

  def mount(_params, _session, socket) do
    socket = assign(
      socket,
      form: to_form(Gistis.change_gisti(%Gisti{}))
    )

    {:ok, socket}
  end
end
