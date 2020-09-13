defmodule LiveChartWeb.LiveColumnComponent do
  @moduledoc """
  Column Chart Component
  """

  use Phoenix.LiveComponent

  def update(assigns, socket) do
    y_axis = assigns.chart.dataset.axes.magnitude_axis
    # Hardcode the number of steps to take as 5 for now
    grid_lines = y_axis.grid_lines.({y_axis.min, y_axis.max}, 5)
    grid_line_offsetter = fn grid_line -> 100 * (y_axis.max - grid_line) / y_axis.max end

    socket =
      socket
      |> assign(:chart, assigns.chart)
      |> assign(:columns, Uncharted.ColumnChart.columns(assigns.chart))
      |> assign(:grid_lines, grid_lines)
      |> assign(:grid_line_offsetter, grid_line_offsetter)

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_column.html", assigns)
  end
end
