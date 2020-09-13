defprotocol Uncharted.BarChart do
  @spec bars(Uncharted.chart() | Uncharted.BarChart.Dataset.t()) ::
          list(Uncharted.BarChart.Bar.t())
  @doc """
  Returns a list of the `Uncharted.BarChart.Bar.t()` that should be rendered by the chart display adapter
  """
  def bars(chart)
end
