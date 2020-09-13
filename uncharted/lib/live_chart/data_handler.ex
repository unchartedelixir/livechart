defmodule Uncharted.DataHandler do
  @moduledoc """
  `Uncharted.DataHandler` is a callback module for use in
  client applications. Implement the callbacks defined here
  to bootstrap a `Uncharted.chart()`, and pass it into a view
  function for rendering.
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
