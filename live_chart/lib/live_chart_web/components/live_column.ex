defmodule LiveChartWeb.LiveColumnComponent do
  use Phoenix.LiveComponent

  alias LiveChart.Chart

  def update(assigns, socket) do
    {:ok, assign(socket, chart: assigns.chart, columns: LiveChart.ColumnChart.columns(assigns.chart))}
  end

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_column.html", assigns)
  end
end
