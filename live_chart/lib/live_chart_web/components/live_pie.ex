defmodule LiveChartWeb.LivePieComponent do
  alias LiveChart.Chart
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div data-testid="lc-live-pie-component" class="hero"><%= Chart.title(@chart) %></div>
    """
  end
end
