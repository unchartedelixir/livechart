defprotocol Uncharted.ProgressChart do
  @type data_container :: Uncharted.chart() | Uncharted.ProgressChart.Dataset.t()

  @spec progress(data_container) :: non_neg_integer()
  def progress(chart)

  @spec data(data_container) :: Uncharted.ProgressChart.Dataset.t()
  def data(chart)
end
