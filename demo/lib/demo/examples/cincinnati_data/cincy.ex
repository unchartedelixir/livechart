defmodule Demo.Examples.Cincy do
  @moduledoc """
  Data structure and functions for fake
  Cincinnati-related data. `get/0` starts
  a timer that will send `:update_coney_consumption`
  messages to the calling process every 5 seconds.
  """
  alias LiveChart.BaseChart
  alias LiveChart.BaseDatum
  alias LiveChart.ColumnChart.Dataset

  @behaviour LiveChart.DataHandler
  defstruct [:neighborhood, :cheese_coney_consumption]

  @type t() :: %__MODULE__{
          neighborhood: String.t(),
          cheese_coney_consumption: non_neg_integer()
        }
  @neighborhoods ~w(Landen Oakley Downtown Florence Erlanger)

  @impl true
  def get do
    loop_updates()
    neighborhoods_to_datum()
  end

  @impl true
  def update_chart(%BaseChart{dataset: %Dataset{} = dataset} = chart, _) do
    %BaseChart{chart | dataset: %Dataset{dataset | data: neighborhoods_to_datum()}}
  end

  defp neighborhoods_to_datum do
    @neighborhoods
    |> Enum.map(fn neighborhood ->
      %BaseDatum{
        name: neighborhood,
        fill_color: :rose_gradient,
        values: [random_number_of_cheese_coneys()]
      }
    end)
  end

  defp loop_updates do
    :timer.send_interval(5_000, self(), :update_coney_consumption)
  end

  defp random_number_of_cheese_coneys do
    :rand.uniform() * 10_000
  end
end
