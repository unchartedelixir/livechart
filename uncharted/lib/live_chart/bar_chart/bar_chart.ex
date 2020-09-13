defprotocol LiveChart.BarChart do
  @spec bars(LiveChart.chart() | LiveChart.BarChart.Dataset.t()) ::
          list(LiveChart.BarChart.Bar.t())
  def bars(chart)
end
