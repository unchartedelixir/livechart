defmodule Uncharted.BarChart.Dataset do
  @moduledoc """
  Struct representing a dataset for a Uncharted basic bar chart.
  """
  defstruct [:axes, :data]

  @type t() :: %__MODULE__{
          axes: Uncharted.BaseAxes.t(),
          data: list(Uncharted.BaseDatum.t())
        }
end
