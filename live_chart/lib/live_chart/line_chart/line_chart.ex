defprotocol LiveChart.LineChart do
  @spec points(LiveChart.chart() | LiveChart.ColumnChart.Dataset.t()) ::
          list(LiveChart.LineChart.Point.t())
  def points(chart)
end
