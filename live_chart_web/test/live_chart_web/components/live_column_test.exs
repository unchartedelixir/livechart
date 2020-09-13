defmodule LiveChartWeb.LiveColumnComponentTest do
  alias LiveChart.BaseChart
  alias LiveChart.Axes.{XYAxes, MagnitudeAxis}
  alias LiveChart.ColumnChart.Dataset
  alias LiveChartWeb.LiveColumnComponent
  import Phoenix.LiveViewTest
  use ExUnit.Case
  @endpoint Endpoint
  @axes %XYAxes{
    y: %MagnitudeAxis{
      min: 0,
      max: 2500,
      grid_lines: &__MODULE__.grid_line_fun/2
    }
  }
  @base_chart %BaseChart{title: "this title", dataset: %Dataset{axes: @axes, data: []}}

  describe "LiveColumnComponent" do
    test "renders" do
      assert render_component(LiveColumnComponent, chart: @base_chart) =~
               ~s(data-testid="lc-live-column-component")
    end

    test "renders the chart's title" do
      assert render_component(LiveColumnComponent, chart: @base_chart) =~ @base_chart.title
    end
  end

  def grid_line_fun({min, max}, _step) do
    Enum.take_every(min..max, 500)
  end
end
