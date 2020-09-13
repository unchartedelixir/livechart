defmodule Uncharted.PieChartTest do
  alias Uncharted.{
    BaseChart,
    BaseDatum,
    PieChart
  }

  use ExUnit.Case

  @data [
    %BaseDatum{name: "Bar One", values: [20.0]},
    %BaseDatum{name: "Bar Two", values: [24.0]},
    %BaseDatum{name: "Bar Three", values: [27.0]},
    %BaseDatum{name: "Bar Four", values: [7.0]},
    %BaseDatum{name: "Bar Five", values: [22.0]}
  ]
  @dataset %PieChart.Dataset{data: @data}
  @chart %BaseChart{title: "title", dataset: @dataset}

  describe "pie_slices/1" do
    test "returns the number of slices that make up the dataset" do
      assert length(PieChart.pie_slices(@chart)) == length(@data)
    end

    test "returns pie slice labels" do
      pie_slices = Enum.map(PieChart.pie_slices(@chart), & &1.label)
      labels = Enum.map(@data, & &1.name)

      assert pie_slices
             |> Enum.zip(labels)
             |> Enum.all?(fn {actual, expected} -> actual == expected end)
    end

    test "returns correct percentages for slices" do
      pie_slice_percentages = Enum.map(PieChart.pie_slices(@chart), & &1.percentage)
      expected_percentages = [20.0, 24.0, 27.0, 7.0, 22.0]

      assert pie_slice_percentages == expected_percentages
    end
  end
end
