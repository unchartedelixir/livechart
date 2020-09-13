defimpl LiveChart.PieChart, for: LiveChart.BaseChart do
  alias LiveChart.BaseChart
  alias LiveChart.PieChart.PieSlice

  def pie_slices(%BaseChart{dataset: nil}), do: []

  def pie_slices(%BaseChart{dataset: %{data: []}}), do: []

  def pie_slices(%BaseChart{dataset: %{data: data}}) do
    data
    |> Enum.with_index()
    |> Enum.map(fn {datum, index} ->
      %PieSlice{
        label: datum.name,
        percentage: hd(datum.values),
        fill_color: datum.fill_color
      }
    end)
  end
end
