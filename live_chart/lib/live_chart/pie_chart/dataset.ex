defmodule LiveChart.PieChart.Dataset do
  @moduledoc """
  Struct representing a dataset for a LiveChart basic pie chart.
  """
  defstruct [:data]

  @type t() :: %__MODULE__{
          data: LiveChart.PieChart.Dataset.t()
        }
end
