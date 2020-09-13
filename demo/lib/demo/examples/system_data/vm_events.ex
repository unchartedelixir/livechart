defmodule Demo.SystemData.VMEvents do
  @moduledoc """
  Publishes VM event data on over PubSub.
  """
  alias Phoenix.PubSub
  @topic "vm_events"

  def subscribe do
    PubSub.subscribe(Demo.PubSub, @topic)
  end

  def publish(event, measurements) do
    Task.start(fn ->
      PubSub.broadcast(Demo.PubSub, @topic, {event, measurements})
    end)
  end
end
