defmodule LiveChartWeb.LiveProgressComponentTest do
  alias LiveChartWeb.LiveProgressComponent
  import Phoenix.LiveViewTest
  use ExUnit.Case

  @endpoint NotAThingYet

  describe "LiveProgress component" do
    test "render/1 mounts successfully" do
      assert render_component(LiveProgressComponent, []) =~
               ~s(data-testid="lc-live-progress-component")
    end
  end
end
