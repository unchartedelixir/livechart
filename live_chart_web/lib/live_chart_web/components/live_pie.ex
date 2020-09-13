defmodule LiveChartWeb.LivePieComponent do
  use Phoenix.LiveComponent

  def update(assigns, socket) do
    socket =
      socket
      |> assign(:chart, assigns.chart)
      |> assign(:pie_slices, LiveChart.PieChart.pie_slices(assigns.chart))

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_pie.html", assigns)
  end
end
