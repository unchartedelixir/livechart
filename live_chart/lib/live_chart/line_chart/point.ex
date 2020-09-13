defmodule LiveChart.LineChart.Point do
  @moduledoc """
  A struct representing a Point on an x, y coordinate chart
  """

  defstruct [:label, :fill_color, :x_offset, :y_offset]

  @type t() :: %__MODULE__{
          label: String.t(),
          fill_color: atom(),
          x_offset: Float.t(),
          y_offset: Float.t()
        }
end
