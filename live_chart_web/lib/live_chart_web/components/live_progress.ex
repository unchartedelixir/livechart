defmodule LiveChartWeb.LiveProgressComponent do
  alias LiveChart.ProgressChart
  use Phoenix.LiveComponent

  def update(assigns, socket) do
    socket =
      socket
      |> assign(:chart, assigns.chart)
      |> assign(:data, ProgressChart.data(assigns.chart))
      |> assign(:progress, ProgressChart.progress(assigns.chart))

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_progress.html", assigns)
  end
end
