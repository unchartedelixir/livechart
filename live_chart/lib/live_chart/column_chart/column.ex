defmodule LiveChart.ColumnChart.Column do
  @moduledoc """
  A struct representing column-level display properties.
  """

  defstruct [:width, :offset, :label, :bar_width, :bar_offset, :column_height]

  @type t() :: %__MODULE__{
          width: Float.t(),
          offset: Float.t(),
          label: String.t(),
          bar_width: Float.t(),
          bar_offset: Float.t(),
          column_height: Float.t()
        }
end
