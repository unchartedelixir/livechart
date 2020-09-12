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
    alias LiveChart.ColumnChart.Column

    def columns(%BaseChart{dataset: nil}), do: []

    def columns(%BaseChart{dataset: %{data: data}}),
      do: Enum.map(data, fn datum -> %Column{label: datum.name} end)
  end
end

defmodule LiveChart.BaseColumnDataset do
  defstruct [:xaxis, :yaxis, :axes, :data]
end

defmodule LiveChart.BaseAxes do
  defstruct show_gridlines: true
end

defmodule LiveChart.BaseDatum do
  defstruct [:name, :color, :values]
end
