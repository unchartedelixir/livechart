defmodule Uncharted.BaseDatum do
  @moduledoc """
  Exposes a struct representing a basic data point
  for a LiveChart.
  """
  defstruct [:name, :fill_color, :values]

  @type t() :: %__MODULE__{
          name: String.t(),
          fill_color: atom(),
          values: list(number)
        }
end
