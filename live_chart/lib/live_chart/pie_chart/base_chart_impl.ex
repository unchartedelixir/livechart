defimpl LiveChart.PieChart, for: LiveChart.BaseChart do
  alias LiveChart.BaseChart
  alias LiveChart.PieChart.PieSlice

  def pie_slices(%BaseChart{dataset: nil}), do: []

  def pie_slices(%BaseChart{dataset: %{data: []}}), do: []

  def pie_slices(%BaseChart{dataset: %{data: data}}) do
    data
    |> Enum.map(fn datum ->
      %PieSlice{
        label: datum.name,
        percentage: hd(datum.values),
        fill_color: datum.fill_color
      }
    end)
  end
end
