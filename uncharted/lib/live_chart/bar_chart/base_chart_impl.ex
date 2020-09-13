defimpl LiveChart.BarChart, for: LiveChart.BaseChart do
  alias LiveChart.BaseChart
  alias LiveChart.BarChart.{Bar, Dataset}

  def bars(%BaseChart{dataset: nil}), do: []
  def bars(%BaseChart{dataset: dataset}), do: bars(dataset)
  def bars(%Dataset{data: []}), do: []

  def bars(%Dataset{data: data, axes: %{magnitude_axis: %{max: max}}}) do
    height = 100.0 / Enum.count(data)
    margin = height / 4.0

    data
    |> Enum.with_index()
    |> Enum.map(fn {datum, index} ->
      offset = index * height
      bar_width = hd(datum.values) / max * 100

      %Bar{
        label: datum.name,
        height: height,
        offset: offset,
        bar_offset: offset + margin,
        bar_height: height / 2.0,
        bar_width: bar_width,
        fill_color: datum.fill_color
      }
    end)
  end
end
