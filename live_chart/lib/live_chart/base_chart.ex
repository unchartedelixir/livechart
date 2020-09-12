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

    def columns(%BaseChart{dataset: %{data: data}}) do
      width = 100.0 / Enum.count(data)
      margin = width / 4.0
      data
      |> Enum.with_index()
      |> Enum.map(fn {datum, index} ->
        offset = index * width
        %Column{
          label: datum.name,
          width: width,
          offset: offset,
          bar_offset: offset + margin,
          bar_width: width / 2.0
        }
      end)
    end
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
