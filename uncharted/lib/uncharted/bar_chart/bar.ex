defmodule Uncharted.BarChart.Bar do
  @moduledoc """
  A struct representing bar-level display properties.
  """

  defstruct [:height, :offset, :label, :bar_height, :bar_offset, :bar_width, :fill_color]

  @type t() :: %__MODULE__{
          height: Float.t(),
          offset: Float.t(),
          label: String.t(),
          bar_height: Float.t(),
          bar_offset: Float.t(),
          bar_width: Float.t(),
          fill_color: atom()
        }
end
