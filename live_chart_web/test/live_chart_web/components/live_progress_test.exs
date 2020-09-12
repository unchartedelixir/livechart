defmodule LiveChartWeb.LiveProgressComponentTest do
  alias LiveChart.BaseChart
  alias LiveChartWeb.LiveProgressComponent
  import Phoenix.LiveViewTest
  use ExUnit.Case

  @endpoint NotAThingYet
  @chart %BaseChart{
    title: "my progress chart"
  }

  describe "LiveProgress component" do
    test "render/1 mounts successfully" do
      assert render_component(LiveProgressComponent, chart: @chart) =~
               ~s(data-testid="lc-live-progress-component")
    end

    test "renders title for accessibility" do
      assert render_component(LiveProgressComponent, chart: @chart) =~ @chart.title
    end
  end
end
