defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

  alias LiveChart.{BaseChart, BaseDatum, Gradient}
  alias LiveChart.Axes.{BaseAxes, YAxis}
  alias LiveChart.ColumnChart
  alias LiveChart.PieChart
  alias LiveChart.ProgressChart

  @impl true
  def mount(_params, _session, socket) do
    column_chart = %BaseChart{
      title: "Umbrellas per Neighborhood",
      colors: %{
        blue: "#36D1DC",
        rosy_gradient: %Gradient{
          start_color: "#642B73",
          stop_color: "#C6426E"
        }
      },
      dataset: %ColumnChart.Dataset{
        axes: %BaseAxes{
          y: %YAxis{
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
            fill_color: :rosy_gradient,
            values: [750.0]
          },
          %BaseDatum{
            name: "Oakley",
            fill_color: :rosy_gradient,
            values: [1500.0]
          },
          %BaseDatum{
            name: "Downtown",
            fill_color: :rosy_gradient,
            values: [2500.0]
          },
          %BaseDatum{
            name: "Florence",
            fill_color: :blue,
            values: [750.0]
          },
          %BaseDatum{
            name: "Erlanger",
            fill_color: :rosy_gradient,
            values: [1750.0]
          }
        ]
      }
    }

    pie_chart = %BaseChart{
      title: "Best kind of pie",
      colors: %{
        blue: "#0000FF",
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

    progress_chart = progress_chart(from: column_chart)

    {:ok,
     assign(socket,
       column_chart: column_chart,
       pie_chart: pie_chart,
       progress_chart: progress_chart
     )}
  end

  defp progress_chart(from: %BaseChart{} = chart) do
    %BaseChart{chart | dataset: %ProgressChart.Dataset{}}
  end
end
