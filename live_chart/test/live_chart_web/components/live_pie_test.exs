defmodule LiveChartWeb.LivePieComponentTest do
  alias LiveChartWeb.LivePieComponent
  import Phoenix.LiveViewTest
  use ExUnit.Case
  @endpoint LiveChart.Endpoint

  describe "LivePie" do
    test "renders pie" do
      assert render_component(LivePieComponent, []) =~ ~s(data-testid="lc-live-pie-component")
    end
  end
end
