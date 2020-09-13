defmodule Demo.SystemData.Memory do
  @moduledoc """
  Pulls memory data from :erlang.memory()
  and formats for display in a Progress Chart.
  """
  @behaviour Uncharted.DataHandler
  alias Uncharted.BaseChart
  alias Uncharted.ProgressChart.Dataset

  @impl true
  def get do
    memory = :erlang.memory()
    total = Keyword.get(memory, :total)
    process_memory = Keyword.get(memory, :processes)
    %{total: total, process: process_memory}
  end

  @impl true
  def update_chart(%BaseChart{dataset: %Dataset{} = dataset} = chart, memory) do
    %BaseChart{
      chart
      | dataset: %Dataset{dataset | to_value: memory.total, current_value: memory.processes}
    }
  end
end
