defmodule LiveChart.BaseChartTest do
  alias LiveChart.{Chart, ColumnChart, BaseChart, BaseColumnDataset, BaseDatum}
  use ExUnit.Case

  @data [
    %BaseDatum{name: "Bar One", values: [750]},
    %BaseDatum{name: "Bar Two", values: [1500]},
    %BaseDatum{name: "Bar Three", values: [2500]},
    %BaseDatum{name: "Bar Four", values: [750]},
    %BaseDatum{name: "Bar Five", values: [1750]}
  ]
  @dataset %BaseColumnDataset{data: @data}
  @chart %BaseChart{title: "title", dataset: @dataset}

  describe "title/1" do
    test "returns the title of the chart" do
      assert Chart.title(@chart) == @chart.title
    end

    test "returns an empty string if title is nil" do
      assert Chart.title(%BaseChart{}) == ""
    end
  end

  describe "columns/1" do
    test "returns the number of columns that make up the dataset" do
      assert length(ColumnChart.columns(@chart)) == length(@data)
    end

    test "returns column labels" do
      columns = Enum.map(ColumnChart.columns(@chart), & &1.label)
      labels = Enum.map(@data, & &1.name)

      assert columns
      |> Enum.zip(labels)
      |> Enum.all?(fn {actual, expected} -> actual == expected end)
    end

    test "returns evenly distributed column widths" do
      column_widths = Enum.map(ColumnChart.columns(@chart), & &1.width)
      expected_column_width = 20.0

      assert Enum.all?(column_widths, fn(column_width) -> column_width == expected_column_width end)
    end

    test "returns correct column offsets" do
      column_offsets = Enum.map(ColumnChart.columns(@chart), & &1.offset)
      expected_column_offsets = [0.0, 20.0, 40.0, 60.0, 80.0]

      assert column_offsets == expected_column_offsets
    end
  end
end
