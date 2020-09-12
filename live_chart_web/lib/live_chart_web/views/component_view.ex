defmodule LiveChartWeb.ComponentView do
  use Phoenix.View,
    root: "lib/live_chart_web/components",
    namespace: LiveChartWeb,
    path: ""

  use Phoenix.HTML

  alias LiveChart.Chart
  alias LiveChart.ColumnChart.Column
end
