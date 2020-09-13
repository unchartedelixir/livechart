defmodule Uncharted.LineChart.Line do
  @moduledoc """
  A struct representing a Line on a cartesian plane betwen two `Uncharted.LineChart.Point` structs
  """

  alias Uncharted.LineChart.Point

  defstruct [:start, :end]

  @type t() :: %__MODULE__{
          start: Point.t(),
          end: Point.t()
        }
end
