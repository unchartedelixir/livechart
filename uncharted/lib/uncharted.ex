defmodule Uncharted do
  @moduledoc """
  Uncharted is a simple Elixir charting library that generates easy to customize charts.
  """

  @typedoc """
  an atom representing a color that can be used anywhere in the chart where a color is needed
  """
  @type color_name :: atom()

  @typedoc """
  a struct representing the dataset that the chart uses. Dfferent charts needs similar but differing information so this
  is a union type
  """
  @type dataset ::
          Uncharted.ColumnChart.Dataset.t()
          | Uncharted.PieChart.Dataset.t()
          | Uncharted.ProgressChart.Dataset.t()
          | Uncharted.BarChart.Dataset.t()
  @type gen_chart :: %{
          title: String.t(),
          colors: %{color_name() => String.t() | Uncharted.Gradient.t()},
          dataset: dataset
        }

  @typedoc """
  the top level structure that represents the information needed to display a chart
  """
  @type chart ::
          Uncharted.BaseChart.t() | gen_chart()
end
