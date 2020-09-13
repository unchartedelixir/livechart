defmodule LiveChart.ProgressChart.Dataset do
  @moduledoc """
  Exposes a struct representing a data set that drives
  a LiveChart Progress Chart.
  """
  defstruct [:background_color_stroke, :to_value, :current_value]
end
