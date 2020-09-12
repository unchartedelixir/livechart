defprotocol LiveChart.Chart do
  def title(chart)
end

defprotocol LiveChart.ColumnChart do
  def column_names(chart)
end
