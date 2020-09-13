defmodule Uncharted.Axes.BaseAxes do
  @moduledoc """
  Exposes a struct representing configuration for axes on LiveCharts.
  """
  defstruct [:magnitude_axis, :x, :y, show_gridlines: true]

  @type t() :: %__MODULE__{
          magnitude_axis: Uncharted.Axes.MagnitudeAxis.t() | nil,
          x: Uncharted.Axes.MagnitudeAxis.t() | nil,
          y: Uncharted.Axes.MagnitudeAxis.t() | nil,
          show_gridlines: boolean()
        }
end
