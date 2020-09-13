defmodule UnchartedPhoenix.LiveColumnComponentTest do
  alias Uncharted.BaseChart
  alias Uncharted.Axes.{BaseAxes, MagnitudeAxis}
  alias Uncharted.ColumnChart.Dataset
  alias UnchartedPhoenix.LiveColumnComponent
  import Phoenix.LiveViewTest
  use ExUnit.Case
  @endpoint Endpoint
  @axes %BaseAxes{
    magnitude_axis: %MagnitudeAxis{
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
