defmodule LiveChart.BarChartTest do
  alias LiveChart.{
    BaseChart,
    BaseDatum,
    BarChart
  }

  alias LiveChart.Axes.{BaseAxes, MagnitudeAxis}
  use ExUnit.Case

  @x_axis %MagnitudeAxis{min: 0, max: 2500}
  @axes %BaseAxes{magnitude_axis: @x_axis}
  @data [
    %BaseDatum{name: "Bar One", values: [750]},
    %BaseDatum{name: "Bar Two", values: [1500]},
    %BaseDatum{name: "Bar Three", values: [2500]},
    %BaseDatum{name: "Bar Four", values: [750]},
    %BaseDatum{name: "Bar Five", values: [1750]}
  ]
  @dataset %BarChart.Dataset{data: @data, axes: @axes}
  @chart %BaseChart{title: "title", dataset: @dataset}

  describe "bars/1" do
    test "returns the number of bars that make up the dataset" do
      assert length(BarChart.bars(@chart)) == length(@data)
    end

    test "returns bar labels" do
      bars = Enum.map(BarChart.bars(@chart), & &1.label)
      labels = Enum.map(@data, & &1.name)

      assert bars
             |> Enum.zip(labels)
             |> Enum.all?(fn {actual, expected} -> actual == expected end)
    end

    test "returns evenly distributed bar heights" do
      bar_heights = Enum.map(BarChart.bars(@chart), & &1.height)
      expected_bar_height = 20.0

      assert Enum.all?(bar_heights, fn bar_height -> bar_height == expected_bar_height end)
    end

    test "returns bar heights as half of bar heights" do
      bar_heights = Enum.map(BarChart.bars(@chart), & &1.bar_height)
      expected_bar_height = 10.0

      assert Enum.all?(bar_heights, fn bar_height -> bar_height == expected_bar_height end)
    end

    test "returns correct bar heights" do
      column_offsets = Enum.map(BarChart.bars(@chart), & &1.offset)
      expected_column_offsets = [0.0, 20.0, 40.0, 60.0, 80.0]

      assert column_offsets == expected_column_offsets
    end

    test "returns bar_offsets with margins taken into account" do
      bar_offsets = Enum.map(BarChart.bars(@chart), & &1.bar_offset)
      expected_bar_offsets = [5.0, 25.0, 45.0, 65.0, 85.0]

      assert bar_offsets == expected_bar_offsets
    end

    test "calculates bar heights as a percent of y-axis max value" do
      bar_widths = Enum.map(BarChart.bars(@chart), & &1.bar_width)
      expected_bar_widths = [30.0, 60.0, 100.0, 30.0, 70.0]

      assert bar_widths == expected_bar_widths
    end
  end
end
