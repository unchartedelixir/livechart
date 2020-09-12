defmodule LiveChart.Axes.BaseAxes do
  @moduledoc """
  Exposes a struct representing configuration for axes on LiveCharts.
  """
  defstruct [:y, show_gridlines: true]

  @type t() :: %__MODULE__{
          y: LiveChart.Axes.YAxis.t(),
          show_gridlines: boolean()
        }
end
