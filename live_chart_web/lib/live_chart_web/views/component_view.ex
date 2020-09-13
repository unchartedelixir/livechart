defmodule LiveChartWeb.ComponentView do
  use Phoenix.View,
    root: "lib/live_chart_web/components",
    namespace: LiveChartWeb,
    path: ""

  use Phoenix.HTML

  alias LiveChart.{Chart, Gradient}
  alias LiveChart.ColumnChart.Column

  def color_to_fill(colors, name) do
    case Map.get(colors, name) do
      %Gradient{} -> "url(##{Atom.to_string(name)})"
      value -> value
    end
  end

  def svg_id(chart, suffix) do
    base =
      chart
      |> Chart.title()
      |> String.downcase()
      |> String.replace(~r(\s+), "-")

    base <> "-" <> suffix
  end

  def svg_pie_slices(nil), do: []
  def svg_pie_slices([]), do: []

  def svg_pie_slices(pie_slices) do
    label_width = 100 / Enum.count(pie_slices)

    pie_slices
    |> Enum.with_index()
    |> Enum.reduce([], fn {pie_slice, index}, acc ->
      remaining_percentage =
        100 - Enum.reduce(acc, 0, fn slice, sum -> sum + slice.percentage end)

      svg_slice =
        pie_slice
        |> Map.from_struct()
        |> Map.put(:remaining_percentage, remaining_percentage)
        |> Map.put(:label_width, label_width)
        |> Map.put(:label_position, index * label_width)

      [svg_slice | acc]
    end)
    |> Enum.reverse()
  end
end
