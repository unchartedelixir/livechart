defmodule LiveChart.BaseChart do
  @moduledoc """
  Base camp for all of your LiveChart needs.
  """
  alias __MODULE__

  defstruct [:title, :dataset]

  @type t() :: %__MODULE__{
          title: String.t()
        }

  defimpl LiveChart.Chart, for: __MODULE__ do
    alias LiveChart.BaseChart
    def title(%BaseChart{title: nil}), do: ""
    def title(%BaseChart{title: title}), do: title
  end

  defimpl LiveChart.ColumnChart, for: __MODULE__ do
    alias LiveChart.BaseChart
    def column_names(%BaseChart{dataset: %{data: data}}), do: Enum.map(data, fn(datum) -> datum.name end)
  end
end

defmodule LiveChart.BaseColumnDataset do
  defstruct [:xaxis, :yaxis, :axes, :data]
end

defmodule LiveChart.BaseAxes do
  defstruct [show_gridlines: true]
end

defmodule LiveChart.BaseDatum do
  defstruct [:name, :color, :values]
end
