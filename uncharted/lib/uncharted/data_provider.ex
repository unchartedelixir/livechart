defmodule Uncharted.DataProvider do
  @moduledoc """
  `Uncharted.DataProvider` is a callback module for use in
  client applications. Implement the callbacks defined here
  in your application to provide the data that drives a chart's
  underlying `Uncharted.dataset`.

  Let's say we have a list of data we want to render in an
  `Uncharted.BarChart`. We will need to populate the `Uncharted.BarChart`'s
  dataset with a list of data, where each data element is an
  `Uncharted.BaseDatum`.

  Given data that looks like this:

  ```elixir
  [
    %MyApp.Vehicle{id: "supersonic plane ABC", current_velocity: 12000},
    %MyApp.Vehicle{id: "scooter XYZ", current_velocity: 17},
    %MyApp.Vehicle{id: "super car 123", current_velocity: 220}
  ]
  ```

  We will need to transform this data in a way that an `Uncharted.BarChart` can
  understand. We can manage this by defining our own module that implements
  the `Uncharted.DataProvider` behaviour. Here is an example of how that might
  look.

  ```elixir
  defmodule MyApp.Vehicles.DataProvider do
    @behaviour Uncharted.DataProvider
    alias Uncharted.BaseDatum

    # The `get/0` will be used to bootstrap a dataset from scratch.
    @impl true
    def get do
      MyApp.Persistence.list_vehicles()
      |> Enum.map(&vehicle_to_datum/1)
    end

    # `update/2` can be used to react to real-time changes in your dataset
    @impl true
    def update_chart(chart, updates) do
      %Uncharted.BaseChart{
        chart |
        dataset: %Uncharted.ColumnChart.Dataset{
          chart.dataset |
            data: Enum.map(updates, &vehicle_to_datum/1)
        }
      }
    end

    defp vehicle_to_datum(%MyApp.Vehicle{} = vehicle) do
      %BaseDatum{
          name: vehicle.id,
          values: [vehicle.current_velocity],
          fill_color: MyAppWeb.ChartStyles.colors().blue_gradient
        }
    end
  end
  ```

  For further examples, take a look at the `Demo` application examples
  in `Uncharted`'s Github Repo, [here](https://github.com/spawnfest/livechart/tree/master/demo).
  Relevant examples can be found in `Demo.SystemData.MemoryChart` and `Demo.Examples.Cincy`
  [here](https://github.com/spawnfest/livechart/tree/master/demo/lib/demo/examples).

  You can also look at `DemoWeb.PageLive` where chart's are created and data is piped
  into them in realtime using PubSub and Erlang `:timer.send_interval/3` to update the
  charts on the fly.
  """

  @doc """
  Returns data that can be used in a `Uncharted.chart()` dataset.
  """
  @callback get() :: term()

  @doc """
  Updates a `Uncharted.chart`'s dataset.
  """
  @callback update_chart(Uncharted.chart(), term()) :: Uncharted.chart()
end
