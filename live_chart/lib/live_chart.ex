defmodule LiveChart do
  @moduledoc """
  LiveChart keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @type color_name :: String.t()
  @type gen_chart :: %{
          title: String.t(),
          colors: %{color_name() => String.t() | LiveChart.Gradient.t()}
        }
  @type chart ::
          LiveChart.BaseChart.t() | gen_chart()
end
