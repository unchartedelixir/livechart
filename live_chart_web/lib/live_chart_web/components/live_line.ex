defmodule LiveChartWeb.LiveLineComponent do
  @moduledoc """
  Line Chart Component
  """

  use Phoenix.LiveComponent

  def update(assigns, socket) do
    x_axis = assigns.chart.dataset.axes.x
    y_axis = assigns.chart.dataset.axes.y
    # # Hardcode the number of steps to take as 5 for now
    x_grid_lines = x_axis.grid_lines.({x_axis.min, x_axis.max}, 5)
    x_grid_line_offsetter = fn grid_line -> 100 * grid_line / x_axis.max end

    y_grid_lines = y_axis.grid_lines.({y_axis.min, y_axis.max}, 5)
    y_grid_line_offsetter = fn grid_line -> 100 * (y_axis.max - grid_line) / y_axis.max end

    socket =
      socket
      |> assign(:chart, assigns.chart)
      |> assign(:points, LiveChart.LineChart.points(assigns.chart))
      |> assign(:lines, LiveChart.LineChart.lines(assigns.chart))
      |> assign(:x_grid_lines, x_grid_lines)
      |> assign(:x_grid_line_offsetter, x_grid_line_offsetter)
      |> assign(:y_grid_lines, y_grid_lines)
      |> assign(:y_grid_line_offsetter, y_grid_line_offsetter)

    {:ok, socket}
  end

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_line.html", assigns)
  end
end
