defmodule Uncharted.Axes.XYAxes do
  @moduledoc """
  A struct for representing a cartesian plane's axes
  """

  defstruct [:x, :y, show_gridlines: true]

  @type t() :: %__MODULE__{
          x: Uncharted.Axes.MagnitudeAxis.t(),
          y: Uncharted.Axes.MagnitudeAxis.t(),
          show_gridlines: boolean()
        }
end
