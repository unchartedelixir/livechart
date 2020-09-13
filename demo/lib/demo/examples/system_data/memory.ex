defmodule Demo.SystemData.Memory do
  @moduledoc """
  Pulls memory data from :erlang.memory()
  and formats for display in a Progress Chart.
  """

  def get do
    memory = :erlang.memory()
    total = Keyword.get(memory, :total)
    process_memory = Keyword.get(memory, :processes)
    %{total: total, process: process_memory}
  end
end
