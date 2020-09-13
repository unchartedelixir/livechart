defmodule Uncharted do
  @moduledoc """
  Uncharted keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @type color_name :: String.t()
  @type dataset :: Uncharted.ColumnChart.Dataset.t() | Uncharted.PieChart.Dataset.t()
  @type gen_chart :: %{
          title: String.t(),
          colors: %{color_name() => String.t() | Uncharted.Gradient.t()},
          dataset: dataset
        }
  @type chart ::
          Uncharted.BaseChart.t() | gen_chart()
end
