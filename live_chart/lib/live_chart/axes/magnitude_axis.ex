defmodule LiveChart.Axes.MagnitudeAxis do
  @moduledoc """
  Exposes a struct representing configuration for the y axis
  of a LiveChart.
  """
  defstruct [:min, :max, :step, :label, :grid_lines]
  @type min :: number()
  @type max :: number()
  @type step :: integer()
  @type t() :: %__MODULE__{
          min: number(),
          max: number(),
          step: integer(),
          label: String.t() | nil,
          grid_lines: ({min, max}, step -> list(Float.t()))
        }
end
