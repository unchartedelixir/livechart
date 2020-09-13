defmodule Uncharted.Axes.MagnitudeAxis do
  @moduledoc """
  Exposes a struct representing configuration for the y axis
  of a chart.
  """
  defstruct [:min, :max, :step, :label, grid_lines: &__MODULE__.default_grid_lines_fun/2]
  @type min :: number()
  @type max :: number()
  @type step :: integer()
  @type grid_lines_func :: ({min, max}, step -> list(Float.t()))
  @type t() :: %__MODULE__{
          min: number(),
          max: number(),
          step: integer(),
          label: String.t() | nil,
          grid_lines: grid_lines_func
        }

  def default_grid_lines_fun({min, max}, step) do
    min..max
    |> Enum.take_every(div(max - min, step))
    |> Enum.drop(1)
  end
end
