defmodule LiveChart.DataHandler do
  @moduledoc """
  `LiveChart.DataHandler` is a callback module for use in
  client applications. Implement the callbacks defined here
  to bootstrap a `LiveChart.chart()`, and pass it into a view
  function for rendering.
  """

  @doc """
  Returns data that can be used in a `LiveChart.chart()` dataset.
  """
  @callback get() :: term()

  @doc """
  Updates a `LiveChart.chart`'s dataset.
  """
  @callback update_chart(LiveChart.chart(), term()) :: LiveChart.chart()
end
