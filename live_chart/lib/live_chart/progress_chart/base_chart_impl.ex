defimpl LiveChart.ProgressChart, for: LiveChart.BaseChart do
  alias LiveChart.BaseChart
  alias LiveChart.ProgressChart.Dataset

  def progress(%BaseChart{dataset: nil}), do: 0

  def progress(%BaseChart{dataset: %Dataset{} = dataset}) do
    100 * round(dataset.current_value / dataset.to_value)
  end

  def data(%BaseChart{dataset: nil}), do: %{}
  def data(%BaseChart{dataset: dataset}), do: dataset
end

defimpl LiveChart.ProgressChart, for: LiveChart.ProgressChart.Dataset do
  alias LiveChart.ProgressChart.Dataset
  def data(%Dataset{} = data), do: data

  def progress(%Dataset{to_value: to_value, current_value: current_value}) do
    100 * round(current_value / to_value)
  end
end
