defmodule Demo.SystemData.EventHandler do
  @moduledoc """
  This module provides functions to handle events
  published by the BEAM, and will forward VM-related
  data provided by each event to the Demo application's
  `DemoWeb.PageLive` LiveView process. The `DemoWeb.PageLive`
  module will respond to the data being forwarded to it to
  update the example `Uncharted.Chart`s in real time.
  """
  alias Demo.SystemData.VMEvents
  @events_of_interest [[:vm, :memory]]

  def handle_events(event, measurements, _metadata, _config) when event in @events_of_interest do
    VMEvents.publish(event, measurements)
  end
end
