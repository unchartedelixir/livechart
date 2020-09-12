defmodule LiveChart.ColumnChart.Column do
  @moduledoc """
  A struct representing column-level display properties.
  """

  defstruct [:width, :offset, :label]

  @type t() :: %__MODULE__{
          width: Float.t(),
          offset: Float.t(),
          label: String.t()
        }
end
