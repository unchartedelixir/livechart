defmodule LiveChart.BaseChartTest do
  alias LiveChart.Chart
  alias LiveChart.BaseChart
  use ExUnit.Case
  @chart %BaseChart{title: "title"}

  describe "title/1" do
    test "returns the title of the chart" do
      assert Chart.title(@chart) == @chart.title
    end

    test "returns an empty string if title is nil" do
      assert Chart.title(%BaseChart{}) == ""
    end
  end
end
