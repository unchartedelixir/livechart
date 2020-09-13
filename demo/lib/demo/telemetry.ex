defmodule Demo.Telemetry do
  @moduledoc """
  This module sets up event handlers for Telemetry events.
  For the purposes of this demo application, we will be attaching
  to VM-related events, relying on `:telemetry_poller` to update
  on a regular basis. The poller allows the demo app to demonstrate
  live-updating data being piped through to `Uncharted.Chart`s.
  """
  alias Demo.SystemData.EventHandler

  def attach_events do
    :telemetry.attach_many(
      "vm-event-handler",
      [
        [:vm, :memory]
      ],
      &EventHandler.handle_events/4,
      []
    )
  end
end
