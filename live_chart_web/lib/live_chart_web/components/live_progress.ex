defmodule LiveChartWeb.LiveProgressComponent do
  use Phoenix.LiveComponent

  def update(assigns, socket) do
    socket = assign(socket, :chart, assigns.chart)

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_progress.html", assigns)
  end
end
