defmodule DemoWeb.PageLive do
  @moduledoc false

  use DemoWeb, :live_view

  alias LiveChart.{BaseChart, BaseDatum, Gradient}
  alias LiveChart.Axes.{BaseAxes, MagnitudeAxis}
  alias LiveChart.BarChart
  alias LiveChart.ColumnChart
  alias LiveChart.PieChart
  alias LiveChart.ProgressChart

  @impl true
  def mount(_params, _session, socket) do
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
            min: 0,
            grid_lines: fn {min, max}, step ->
              min..max
              |> Enum.take_every(div(max - min, step))
              |> Enum.sort_by(& &1, &>=/2)
              |> Enum.drop(1)
            end
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
        axes: %BaseAxes{
          y: %YAxis{
            max: 2500,
            min: 0,
            grid_lines: fn {min, max}, step ->
              min..max
              |> Enum.take_every(div(max - min, step))
              |> Enum.drop(1)
            end
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

  defp progress_chart(from: %BaseChart{} = chart) do
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
          label: "unchartedness",
          to_value: 100,
          current_value: 65,
          percentage_text_fill_color: :blue_gradient,
          percentage_fill_color: :rose_gradient,
          label_fill_color: :rose_gradient
        }
    }
  end

  defp bar_chart do
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
            max: 2500,
            min: 0,
            grid_lines: fn {min, max}, step ->
              min..max
              |> Enum.take_every(div(max - min, step))
              |> Enum.sort_by(& &1, &>=/2)
              |> Enum.drop(1)
            end
          }
        },
        data: [
          %BaseDatum{
            name: "Erlang",
            fill_color: :rosy_gradient,
            values: [750.0]
          },
          %BaseDatum{
            name: "Ruby",
            fill_color: :rosy_gradient,
            values: [1500.0]
          },
          %BaseDatum{
            name: "Erlang",
            fill_color: :rosy_gradient,
            values: [2500.0]
          },
          %BaseDatum{
            name: "Java",
            fill_color: :blue,
            values: [750.0]
          },
          %BaseDatum{
            name: "Elixir",
            fill_color: :rosy_gradient,
            values: [2500.0]
          }
        ]
      }
    }
  end
end
