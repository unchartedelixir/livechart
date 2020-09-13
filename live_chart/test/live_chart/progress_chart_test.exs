defmodule LiveChart.ProgressChartTest do
  alias LiveChart.BaseChart
  alias LiveChart.ProgressChart
  alias LiveChart.ProgressChart.Dataset
  use ExUnit.Case
  @chart %BaseChart{dataset: %Dataset{to_value: 100, current_value: 25}}

  describe "data/1" do
    test "takes a base chart with a valid progress chart dataset and returns the dataset" do
      assert ProgressChart.data(@chart) == @chart.dataset
    end

    test "takes a progress dataset and passes it through unchanged" do
      assert ProgressChart.data(@chart.dataset) == @chart.dataset
    end

    test "returns an empty map if a chart's dataset is nil" do
      assert ProgressChart.data(%BaseChart{dataset: nil}) == %{}
    end
  end

  describe "progress/1" do
    test "takes a base chart with progress chart dataset and returns the percentage of progress" do
      assert ProgressChart.progress(@chart) == 25
    end

    test "takes a progress chart dataset and returns the percentage of progress" do
      assert ProgressChart.progress(@chart.dataset) == 25
    end
  end
end
