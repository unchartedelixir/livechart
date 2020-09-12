defmodule LiveChart.ColumnChart.Dataset do
  @moduledoc """
  Struct representing a dataset for a LiveChart basic column chart.
  """
  defstruct [:axes, :data]

  @type t() :: %__MODULE__{
          axes: LiveChart.BaseAxes.t(),
          data: LiveChart.ColumnChart.Dataset.t()
        }
end
