defmodule LiveChart.BaseChart do
  @moduledoc """
  Base camp for all of your LiveChart needs.
  """
  alias __MODULE__

  defstruct [:title]

  @type t() :: %__MODULE__{
          title: String.t()
        }

  defimpl LiveChart.Chart, for: __MODULE__ do
    alias LiveChart.BaseChart
    def title(%BaseChart{title: nil}), do: ""
    def title(%BaseChart{title: title}), do: title
  end
end
