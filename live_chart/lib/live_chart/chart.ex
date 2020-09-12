defprotocol LiveChart.Chart do
  def title(chart)
end

defprotocol LiveChart.ColumnChart do
  def columns(chart)
end
