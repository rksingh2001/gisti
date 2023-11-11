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

  def handle_event("create", %{"gisti" => params}, socket) do
    case Gistis.create_gisti(socket.assigns.current_user, params) do
      {:ok, _gist} ->
        changeset = Gistis.change_gisti(%Gisti{})
        {:noreply, assign(socket, :form, to_form(changeset))}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  def handle_event("validate", %{"gisti" => params}, socket) do
    changeset = %Gisti{}
                |> Gisti.changeset(params)
                |> Map.put(:action, :validate)
    {:noreply, assign(socket, :form, to_form(changeset))}
  end
end
