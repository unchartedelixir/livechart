defmodule LiveChartWeb.ComponentView do
  use Phoenix.View,
    root: "lib/live_chart_web/components",
    namespace: LiveChartWeb,
    path: ""

  use Phoenix.HTML

  alias LiveChart.{Chart, Gradient}
  alias LiveChart.ColumnChart.Column

  def color_to_fill(colors, name) do
    case Map.get(colors, name) do
      %Gradient{} -> "url(##{Atom.to_string(name)})"
      value -> value
    end
  end
end
