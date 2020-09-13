defmodule LiveChart.PieChart.PieSlice do
  @moduledoc """
  A struct representing pie chart slice display properties.
  """

  defstruct [:label, :percentage, :fill_color]

  @type t() :: %__MODULE__{
          label: String.t(),
          percentage: Float.t(),
          fill_color: atom()
        }
end
