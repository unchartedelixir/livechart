defprotocol Uncharted.LineChart do
  @spec points(Uncharted.chart() | Uncharted.ColumnChart.Dataset.t()) ::
          list(Uncharted.LineChart.Point.t())
  def points(chart)

  @spec lines(Uncharted.chart() | Uncharted.ColumnChart.Dataset.t()) ::
          list(Uncharted.LineChart.Line.t())
  def lines(chart)
end
