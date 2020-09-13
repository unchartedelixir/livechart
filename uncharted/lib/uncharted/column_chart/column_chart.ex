defprotocol Uncharted.ColumnChart do
  @spec columns(Uncharted.chart() | Uncharted.ColumnChart.Dataset.t()) ::
          list(Uncharted.ColumnChart.Column.t())
  def columns(chart)
end
