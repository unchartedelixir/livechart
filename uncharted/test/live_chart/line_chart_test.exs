defmodule Uncharted.LineChartTest do
  alias Uncharted.{BaseChart, BaseDatum, LineChart}
  alias Uncharted.Axes.{MagnitudeAxis, XYAxes}
  alias Uncharted.ColumnChart.Dataset
  alias Uncharted.LineChart.Line
  use ExUnit.Case

  @x_axis %MagnitudeAxis{min: 0, max: 10}
  @y_axis %MagnitudeAxis{min: -500, max: 2500}
  @axes %XYAxes{x: @x_axis, y: @y_axis}
  @data [
    %BaseDatum{name: "Point One", values: [1, 750]},
    %BaseDatum{name: "Point Two", values: [5, 1500]},
    %BaseDatum{name: "Point Three", values: [6, 2250]},
    %BaseDatum{name: "Point Four", values: [8, 600]},
    %BaseDatum{name: "Point Five", values: [10, 1200]}
  ]
  @dataset %Dataset{data: @data, axes: @axes}
  @chart %BaseChart{title: "title", dataset: @dataset}

  describe "points/1" do
    test "returns the number of points that make up the dataset" do
      assert length(LineChart.points(@chart)) == length(@data)
    end

    test "returns point labels" do
      points = Enum.map(LineChart.points(@chart), & &1.label)
      labels = Enum.map(@data, & &1.name)

      assert points
             |> Enum.zip(labels)
             |> Enum.all?(fn {actual, expected} -> actual == expected end)
    end

    test "calculates point x value as a percent of x-axis min and max value" do
      x_offsets = Enum.map(LineChart.points(@chart), & &1.x_offset)
      expected_x_offsets = [10.0, 50.0, 60.0, 80.0, 100.0]

      assert x_offsets == expected_x_offsets
    end

    test "calculates point y value as a percent of y-axis min and max value" do
      y_offsets = Enum.map(LineChart.points(@chart), & &1.y_offset)
      expected_y_offsets = [25.0, 50.0, 75.0, 20.0, 40.0]

      assert y_offsets == expected_y_offsets
    end
  end

  describe "lines/1" do
    test "returns the number of lines that make up the dataset (# of points - 1)" do
      assert length(LineChart.lines(@chart)) == length(@data) - 1
    end

    test "returns the correct line between first two points" do
      points = LineChart.points(@chart)
      expected_line = %Line{start: Enum.at(points, 0), end: Enum.at(points, 1)}
      actual_lines = LineChart.lines(@chart)

      assert hd(actual_lines) == expected_line
    end

    test "returns the correct line between last two points" do
      points = LineChart.points(@chart)
      expected_line = %Line{start: Enum.at(points, -2), end: Enum.at(points, -1)}
      actual_lines = LineChart.lines(@chart)

      assert List.last(actual_lines) == expected_line
    end
  end
end
