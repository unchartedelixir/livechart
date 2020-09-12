defmodule LiveChartWeb.LivePieComponent do
  alias LiveChart.Chart
  use Phoenix.LiveComponent

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_pie.html", assigns)
  end
end
