defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  alias LiveChart.{BaseAxes, BaseChart, BaseColumnDataset, BaseDatum, YAxis}

  @impl true
  def mount(_params, _session, socket) do
    column_chart = %BaseChart{
      title: "Umbrellas per Neighborhood",
      dataset: %BaseColumnDataset{
        axes: %BaseAxes{y: %YAxis{max: 2500, min: 0}},
        data: [
          %BaseDatum{
            name: "Landen",
            color: "Blue",
            values: [750.0]
          },
          %BaseDatum{
            name: "Oakley",
            color: "Blue",
            values: [1500.0]
          },
          %BaseDatum{
            name: "Downtown",
            color: "Blue",
            values: [2500.0]
          },
          %BaseDatum{
            name: "Florence",
            color: "Blue",
            values: [750.0]
          },
          %BaseDatum{
            name: "Erlanger",
            color: "Red",
            values: [1750.0]
          }
        ]
      }
    }

    {:ok, assign(socket, column_chart: column_chart, query: "", results: %{})}
  end

  @impl true
  def handle_event("suggest", %{"q" => query}, socket) do
    {:noreply, assign(socket, results: search(query), query: query)}
  end

  @impl true
  def handle_event("search", %{"q" => query}, socket) do
    case search(query) do
      %{^query => vsn} ->
        {:noreply, redirect(socket, external: "https://hexdocs.pm/#{query}/#{vsn}")}

      _ ->
        {:noreply,
         socket
         |> put_flash(:error, "No dependencies found matching \"#{query}\"")
         |> assign(results: %{}, query: query)}
    end
  end

  defp search(query) do
    if not DemoWeb.Endpoint.config(:code_reloader) do
      raise "action disabled when not in development"
    end

    for {app, desc, vsn} <- Application.started_applications(),
        app = to_string(app),
        String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
        into: %{},
        do: {app, vsn}
  end
end
