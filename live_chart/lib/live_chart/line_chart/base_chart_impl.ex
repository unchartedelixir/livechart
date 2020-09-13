defimpl LiveChart.LineChart, for: LiveChart.BaseChart do
  alias LiveChart.BaseChart
  alias LiveChart.ColumnChart.Dataset
  alias LiveChart.LineChart.Point

  def points(%BaseChart{dataset: nil}), do: []
  def points(%BaseChart{dataset: dataset}), do: points(dataset)
  def points(%Dataset{data: []}), do: []

  def points(%Dataset{data: data, axes: %{y: %{min: min, max: max}}}) do
    data
    |> Enum.map(fn datum ->
      y_offset = Enum.at(datum.values, 1) / max * 100

      %Point{
        label: datum.name,
        fill_color: datum.fill_color,
        y_offset: y_offset
      }
    end)
  end
end
