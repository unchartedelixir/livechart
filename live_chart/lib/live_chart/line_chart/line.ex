defmodule LiveChart.LineChart.Line do
  @moduledoc """
  A struct representing a Line on a cartesian plane betwen two `LiveChart.LineChart.Point` structs
  """

  alias LiveChart.LineChart.Point

  defstruct [:start, :end]

  @type t() :: %__MODULE__{
          start: Point.t(),
          end: Point.t()
        }
end
