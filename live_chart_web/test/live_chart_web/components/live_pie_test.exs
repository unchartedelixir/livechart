defmodule LiveChartWeb.LivePieComponentTest do
  alias LiveChartWeb.LivePieComponent
  import Phoenix.LiveViewTest
  use ExUnit.Case
  @endpoint Endpoint
  @base_chart %LiveChart.BaseChart{title: "this title"}

  describe "LivePie" do
    test "renders pie" do
      assert render_component(LivePieComponent, chart: @base_chart) =~
               ~s(data-testid="lc-live-pie-component")
    end

    test "renders a chart's title" do
      assert render_component(LivePieComponent, chart: @base_chart) =~ @base_chart.title
    end
  end
end
