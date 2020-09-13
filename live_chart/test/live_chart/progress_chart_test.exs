defmodule LiveChart.ProgressChartTest do
  alias LiveChart.BaseChart
  alias LiveChart.ProgressChart
  alias LiveChart.ProgressChart.Dataset
  use ExUnit.Case
  @chart %BaseChart{dataset: %Dataset{}}

  describe "data/1" do
    test "takes a base chart with a valid progress chart dataset and returns the dataset" do
      assert ProgressChart.data(@chart) == @chart.dataset
    end

    test "takes a progress dataset and passes it through unchanged" do
      assert ProgressChart.data(@chart.dataset) == @chart.dataset
    end
  end
end
