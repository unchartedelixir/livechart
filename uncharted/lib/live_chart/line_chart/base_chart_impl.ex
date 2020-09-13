defimpl LiveChart.LineChart, for: LiveChart.BaseChart do
  alias LiveChart.BaseChart
  alias LiveChart.ColumnChart.Dataset
  alias LiveChart.LineChart.{Line, Point}

  def points(%BaseChart{dataset: nil}), do: []
  def points(%BaseChart{dataset: dataset}), do: points(dataset)
  def points(%Dataset{data: []}), do: []

  def points(%Dataset{
        data: data,
        axes: %{x: %{min: x_min, max: x_max}, y: %{min: y_min, max: y_max}}
      }) do
    data
    |> Enum.map(fn datum ->
      x_offset = Enum.at(datum.values, 0) / (x_max - x_min) * 100
      y_offset = Enum.at(datum.values, 1) / (y_max - y_min) * 100

      %Point{
        label: datum.name,
        fill_color: datum.fill_color,
        x_offset: x_offset,
        y_offset: y_offset
      }
    end)
  end

  def lines(%BaseChart{} = chart) do
    chart
    |> points()
    |> lines_from_points()
  end

  defp lines_from_points([]), do: []

  defp lines_from_points(points) do
    points
    |> Enum.reduce(fn point, acc ->
      case acc do
        {previous_point, lines} ->
          new_line = %Line{start: previous_point, end: point}
          {point, [new_line | lines]}

        previous_point ->
          new_line = %Line{start: previous_point, end: point}
          {point, [new_line]}
      end
    end)
    |> elem(1)
    |> Enum.reverse()
  end
end
