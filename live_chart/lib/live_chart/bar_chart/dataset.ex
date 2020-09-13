defmodule LiveChart.BarChart.Dataset do
  @moduledoc """
  Struct representing a dataset for a LiveChart basic bar chart.
  """
  defstruct [:axes, :data]

  @type t() :: %__MODULE__{
          axes: LiveChart.BaseAxes.t(),
          data: list(LiveChart.BaseDatum.t())
        }
end
