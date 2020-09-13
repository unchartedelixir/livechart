defmodule DemoWeb.PageLive do
  @moduledoc false

  use DemoWeb, :live_view

  alias Demo.SystemData.{Memory, MemoryChart, VMEvents}
  alias LiveChart.{BaseChart, BaseDatum, Gradient}
  alias LiveChart.Axes.{BaseAxes, MagnitudeAxis, XYAxes}
  alias LiveChart.BarChart
  alias LiveChart.ColumnChart
  alias LiveChart.PieChart
  alias LiveChart.ProgressChart

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      VMEvents.subscribe()
    end

    colors = %{
      blue: "#6bdee4",
      rose_gradient: %Gradient{
        start_color: "#642B73",
        stop_color: "#C6426E"
      },
      blue_gradient: %Gradient{
        start_color: "#36D1DC",
        stop_color: "#5B86E5"
      },
      red_gradient: %Gradient{
        start_color: "#FF9486",
        stop_color: "#FF1379"
      }
    }

    column_chart = %BaseChart{
      title: "Umbrellas per Neighborhood",
      colors: colors,
      dataset: %ColumnChart.Dataset{
        axes: %BaseAxes{
          magnitude_axis: %MagnitudeAxis{
            max: 2500,
            min: 0
          }
        },
        data: [
          %BaseDatum{
            name: "Landen",
            fill_color: :rose_gradient,
            values: [750.0]
          },
          %BaseDatum{
            name: "Oakley",
            fill_color: :rose_gradient,
            values: [1500.0]
          },
          %BaseDatum{
            name: "Downtown",
            fill_color: :rose_gradient,
            values: [2500.0]
          },
          %BaseDatum{
            name: "Florence",
            fill_color: :blue,
            values: [750.0]
          },
          %BaseDatum{
            name: "Erlanger",
            fill_color: :rose_gradient,
            values: [1750.0]
          }
        ]
      }
    }

    pie_chart = %BaseChart{
      title: "Best kind of pie",
      colors: %{
        rose_gradient: %Gradient{
          start_color: "#642B73",
          stop_color: "#C6426E"
        },
        blue_gradient: %Gradient{
          start_color: "#36D1DC",
          stop_color: "#5B86E5"
        },
        red_gradient: %Gradient{
          start_color: "#FF9486",
          stop_color: "#FF1379"
        }
      },
      dataset: %PieChart.Dataset{
        data: [
          %BaseDatum{
            name: "Pecan",
            fill_color: :red_gradient,
            values: [20.0]
          },
          %BaseDatum{
            name: "Blueberry",
            fill_color: :blue_gradient,
            values: [28.0]
          },
          %BaseDatum{
            name: "Pumpkin",
            fill_color: :rose_gradient,
            values: [35.0]
          },
          %BaseDatum{
            name: "Chocolate",
            fill_color: :blue_gradient,
            values: [17.0]
          }
        ]
      }
    }

    line_chart = %BaseChart{
      title: "Umbrellas per Neighborhood",
      colors: colors,
      dataset: %ColumnChart.Dataset{
        axes: %XYAxes{
          x: %MagnitudeAxis{
            max: 700,
            min: 0
          },
          y: %MagnitudeAxis{
            max: 2500,
            min: 0
          }
        },
        data: [
          %BaseDatum{
            name: "Point 1",
            fill_color: :blue_gradient,
            values: [70, 500]
          },
          %BaseDatum{
            name: "Point 2",
            fill_color: :blue_gradient,
            values: [150, 1000]
          },
          %BaseDatum{
            name: "Point 3",
            fill_color: :blue_gradient,
            values: [350, 1600]
          },
          %BaseDatum{
            name: "Point 4",
            fill_color: :blue_gradient,
            values: [450, 1500]
          },
          %BaseDatum{
            name: "Point 5",
            fill_color: :blue_gradient,
            values: [550, 2000]
          }
        ]
      }
    }

    progress_chart = progress_chart(from: column_chart)

    {:ok,
     assign(socket,
       bar_chart: bar_chart(),
       column_chart: column_chart,
       pie_chart: pie_chart,
       progress_chart: progress_chart,
       line_chart: line_chart
     )}
  end

  def handle_info({[:vm, :memory], memory}, socket) do
    {:noreply,
     assign(socket, :progress_chart, Memory.update_chart(socket.assigns.progress_chart, memory))}
  end

  def handle_info({[:vm, :system_counts], counts}, socket) do
    {:noreply,
     assign(socket, :bar_chart, MemoryChart.update_chart(socket.assigns.bar_chart, counts))}
  end

  def handle_info(_, socket), do: {:noreply, socket}

  defp progress_chart(from: %BaseChart{} = chart) do
    memory = Memory.get()

    %BaseChart{
      chart
      | colors: %{
          rose_gradient: %Gradient{
            start_color: "#642B73",
            stop_color: "#C6426E"
          },
          blue_gradient: %Gradient{
            start_color: "#36D1DC",
            stop_color: "#5B86E5"
          },
          red_gradient: %Gradient{
            start_color: "#FF9486",
            stop_color: "#FF1379"
          },
          gray: "#e2e2e2"
        },
        dataset: %ProgressChart.Dataset{
          background_stroke_color: :gray,
          label: "Proc Memory",
          secondary_label: "(% Of Total)",
          to_value: memory.total,
          current_value: memory.process,
          percentage_text_fill_color: :blue_gradient,
          percentage_fill_color: :rose_gradient,
          label_fill_color: :rose_gradient
        }
    }
  end

  defp bar_chart do
    memory_data = MemoryChart.get()

    data = MemoryChart.convert_to_datum(memory_data)

    %BaseChart{
      title: "Coolness Units Per Language",
      colors: %{
        blue: "#36D1DC",
        rosy_gradient: %Gradient{
          start_color: "#642B73",
          stop_color: "#C6426E"
        }
      },
      dataset: %BarChart.Dataset{
        axes: %BaseAxes{
          magnitude_axis: %MagnitudeAxis{
            max: MemoryChart.chart_max(memory_data),
            min: 0
          }
        },
        data: data
      }
    }
  end
end
