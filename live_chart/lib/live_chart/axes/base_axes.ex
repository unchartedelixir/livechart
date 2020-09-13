defmodule LiveChart.Axes.BaseAxes do
  @moduledoc """
  Exposes a struct representing configuration for axes on LiveCharts.
  """
  defstruct [:magnitude_axis, show_gridlines: true]

  @type t() :: %__MODULE__{
          magnitude_axis: LiveChart.Axes.MagnitudeAxis.t(),
          show_gridlines: boolean()
        }
end
