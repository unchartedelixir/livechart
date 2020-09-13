defmodule LiveChart.LineChartTest do
  alias LiveChart.{
    BaseChart,
    BaseDatum,
    LineChart
  }
  alias LiveChart.Axes.{BaseAxes, YAxis}
  alias LiveChart.ColumnChart.Dataset
  use ExUnit.Case

  @y_axis %YAxis{min: 0, max: 2500}
  @axes %BaseAxes{y: @y_axis}
  @data [
    %BaseDatum{name: "Point One", values: [1, 750]},
    %BaseDatum{name: "Point Two", values: [5, 1500]},
    %BaseDatum{name: "Point Three", values: [6, 2500]},
    %BaseDatum{name: "Point Four", values: [8, 750]},
    %BaseDatum{name: "Point Five", values: [10, 1750]}
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

    # test "returns correct column offsets" do
    #   column_offsets = Enum.map(ColumnChart.columns(@chart), & &1.offset)
    #   expected_column_offsets = [0.0, 20.0, 40.0, 60.0, 80.0]

    #   assert column_offsets == expected_column_offsets
    # end

    test "calculates point y value as a percent of y-axis min and max value" do
      y_offsets = Enum.map(LineChart.points(@chart), & &1.y_offset)
      expected_y_offsets = [30.0, 60.0, 100.0, 30.0, 70.0]

      assert y_offsets == expected_y_offsets
    end
  end
end
