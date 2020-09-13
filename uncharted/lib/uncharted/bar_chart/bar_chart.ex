defprotocol Uncharted.BarChart do
  @spec bars(Uncharted.chart() | Uncharted.BarChart.Dataset.t()) ::
          list(Uncharted.BarChart.Bar.t())
  def bars(chart)
end
