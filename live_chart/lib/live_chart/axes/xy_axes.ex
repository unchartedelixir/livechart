defmodule LiveChart.Axes.XYAxes do
  @moduledoc """
  A struct for representing a cartesian plane
  """

  defstruct [:x, :y, show_gridlines: true]

  @type t() :: %__MODULE__{
    x: LiveChart.Axes.MagnitudeAxis.t(),
    y: LiveChart.Axes.MagnitudeAxis.t(),
    show_gridlines: boolean()
  }
end
