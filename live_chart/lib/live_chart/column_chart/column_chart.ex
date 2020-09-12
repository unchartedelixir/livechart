defprotocol LiveChart.ColumnChart do
  @spec columns(LiveChart.chart() | LiveChart.ColumnChart.Dataset.t()) ::
          list(LiveChart.ColumnChart.Column.t())
  def columns(chart)
end
