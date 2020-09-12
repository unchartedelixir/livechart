defmodule LiveChartWeb.LiveProgressComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    Phoenix.View.render(LiveChartWeb.ComponentView, "live_progress.html", assigns)
  end
end
