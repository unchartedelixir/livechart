defprotocol LiveChart.Chart do
  def title(chart)
  def colors(chart)
  def gradient_colors(chart)
end

defprotocol LiveChart.ColumnChart do
  def columns(chart)
end
