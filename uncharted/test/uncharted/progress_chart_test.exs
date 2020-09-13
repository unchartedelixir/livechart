defmodule Uncharted.ProgressChartTest do
  alias Uncharted.BaseChart
  alias Uncharted.ProgressChart
  alias Uncharted.ProgressChart.Dataset
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

    test "returns zero if given a chart with an empty dataset" do
      assert ProgressChart.progress(%BaseChart{dataset: nil}) == 0
    end
  end
end
