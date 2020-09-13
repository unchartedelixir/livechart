defprotocol LiveChart.ProgressChart do
  @type data_container :: LiveChart.chart() | LiveChart.ProgressChart.Dataset.t()

  @spec progress(data_container) :: non_neg_integer()
  def progress(chart)

  @spec data(data_container) :: LiveChart.ProgressChart.Dataset.t()
  def data(chart)
end
