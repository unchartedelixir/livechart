defmodule LiveChartWeb.LiveColumnComponent do
  use Phoenix.LiveComponent

  alias LiveChart.Chart

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_column.html", assigns)
  end
end
