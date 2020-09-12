defmodule LiveChartWeb.LivePieComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div data-testid="lc-live-pie-component" class="hero">HELLO WORLD</div>
    """
  end
end
