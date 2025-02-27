defmodule NovySiteWeb.HomeLive do
  use NovySiteWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket, layout: {NovySiteWeb.Layouts, :blank}}
  end
end
