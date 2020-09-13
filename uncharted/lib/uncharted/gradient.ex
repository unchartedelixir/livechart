defmodule Uncharted.Gradient do
  @moduledoc """
  Definition of a gradient between colors
  """

  @type t() :: %__MODULE__{
          start_color: String.t(),
          stop_color: String.t()
        }

  defstruct [:start_color, :stop_color]
end
