defmodule LiveChart.BaseChartTest do
  alias LiveChart.{
    Chart,
    ColumnChart,
    Gradient,
    BaseChart,
    BaseDatum
  }

  alias LiveChart.Axes.{BaseAxes, YAxis}
  use ExUnit.Case

  @y_axis %YAxis{min: 0, max: 2500}
  @axes %BaseAxes{y: @y_axis}
  @data [
    %BaseDatum{name: "Bar One", values: [750]},
    %BaseDatum{name: "Bar Two", values: [1500]},
    %BaseDatum{name: "Bar Three", values: [2500]},
    %BaseDatum{name: "Bar Four", values: [750]},
    %BaseDatum{name: "Bar Five", values: [1750]}
  ]
  @dataset %ColumnChart.Dataset{data: @data, axes: @axes}
  @chart %BaseChart{title: "title", dataset: @dataset}

  describe "title/1" do
    test "returns the title of the chart" do
      assert Chart.title(@chart) == @chart.title
    end

    test "returns an empty string if title is nil" do
      assert Chart.title(%BaseChart{}) == ""
    end
  end

  describe "gradient_colors/1" do
    test "returns only gradient colors" do
      expected_gradient_colors = %{
        blue_gradient: %Gradient{
          start_color: "#0011FF",
          stop_color: "#1100FF"
        }
      }

      colors = Map.put(expected_gradient_colors, :red, "#FF0000")
      chart = %BaseChart{title: "title", dataset: @dataset, colors: colors}

      assert Chart.gradient_colors(chart) == expected_gradient_colors
    end
  end
end
