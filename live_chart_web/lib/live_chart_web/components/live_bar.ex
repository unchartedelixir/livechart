defmodule LiveChartWeb.LiveBarComponent do
  @moduledoc """
  Bar Chart Component
  """

  use Phoenix.LiveComponent

  def update(assigns, socket) do
    # x_axis = assigns.chart.dataset.axes.magnitude_axis
    # Hardcode the number of steps to take as 5 for now
    # grid_lines = y_axis.grid_lines.({y_axis.min, y_axis.max}, 5)
    # grid_line_offsetter = fn grid_line -> 100 * (y_axis.max - grid_line) / y_axis.max end

    socket =
      socket
      |> assign(:chart, assigns.chart)
      |> assign(:columns, LiveChart.BarChart.bars(assigns.chart))

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_bar.html", assigns)
  end
end
