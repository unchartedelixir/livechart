defmodule LiveChart.LineChart.Point do
  @moduledoc """
  A struct representing a Point on an x, y coordinate chart
  """

  defstruct [:label, :fill_color, :y_offset]

  @type t() :: %__MODULE__{
          label: String.t(),
          fill_color: atom(),
          y_offset: Float.t()
        }
end
