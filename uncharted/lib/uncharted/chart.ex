defprotocol Uncharted.Chart do
  @doc """
  Takes an `Uncharted.chart` data structure
  and returns a title for the chart. The title
  can be used for display purposes, and will
  also be used for accessibility in contexts
  such as web-based SVG charts.
  """
  @spec title(Uncharted.chart()) :: String.t()
  def title(chart)

  @doc """
  Returns a map where the keys are atoms representing color names
  and the values are either Strings representing hex values or
  `Uncharted.Gradient` structs that can be used to style data
  points in your chart with a gradient.

  ## Examples

      Uncharted.Chart.colors(my_chart)
      %{
        blue: "#6bdee4",
        rose_gradient: %Uncharted.Gradient{
          start_color: "#642B73",
          stop_color: "#C6426E"
        }
      }
  """
  @spec colors(Uncharted.chart()) :: %{
          Uncharted.color_name() => String.t() | Uncharted.Gradient.t()
        }
  def colors(chart)

  @doc """
  Returns a map containing only `Uncharted.Gradient` colors.
  This can be used in views to draw and configure gradients
  in different contexts.

  ## Examples

        Uncharted.Chart.colors(my_chart)
        %{
          rose_gradient: %Uncharted.Gradient{
            start_color: "#642B73",
            stop_color: "#C6426E"
          },
          blue_gradient: %Uncharted.Gradient{
            start_color: "#36D1DC",
            stop_color: "#5B86E5"
          }
        }
  """
  @spec gradient_colors(Uncharted.chart()) :: %{Uncharted.color_name() => Uncharted.Gradient.t()}
  def gradient_colors(chart)
end
