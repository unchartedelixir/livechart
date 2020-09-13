defmodule Demo.SystemData.MemoryChart do
  @moduledoc """
  Fetches system data from `:erlang.memory/1`
  and presents it for use with a `Uncharted.BarChart`.
  """
  @behaviour Uncharted.DataProvider
  alias Uncharted.BarChart.Dataset
  alias Uncharted.BaseChart
  alias Uncharted.BaseDatum

  @impl true
  def get do
    :erlang.memory()
    |> format_data()
    |> filter_out_system_and_total()
  end

  @impl true
  def update_chart(%BaseChart{dataset: %Dataset{} = dataset} = chart, counts) do
    %BaseChart{
      chart
      | dataset: %Dataset{
          dataset
          | data: counts |> format_data() |> convert_to_datum()
        }
    }
  end

  def convert_to_datum(data) do
    Enum.map(data, fn {name, value} ->
      %BaseDatum{name: name, fill_color: :rosy_gradient, values: [value]}
    end)
  end

  ### This is used to configure a maximum point for the
  ### chart axis that will be displaying the values.
  ### The goal is to choose a sensible maximum value for the
  ### values being displayed in the chart. We intend to move
  ### a function that will achieve this automatically in the
  ### `Uncharted` package.
  def chart_max(process_count) do
    process_count
    |> Enum.map(fn {_, bytes} ->
      bytes
    end)
    |> logical_max_for_chart()
  end

  defp format_data(process_data) do
    process_data
    |> Enum.map(fn {info, number} -> {atom_name_to_string(info), bytes_to_kilobytes(number)} end)
  end

  defp filter_out_system_and_total(memory_data) do
    memory_data
    |> Enum.reject(fn {name, _} -> String.downcase(name) in ["total", "system"] end)
  end

  defp atom_name_to_string(atom) do
    atom
    |> Atom.to_string()
    |> String.replace("_", " ")
    |> String.split(" ")
    |> Enum.map(&String.capitalize(&1))
    |> Enum.join(" ")
  end

  defp bytes_to_kilobytes(bytes), do: bytes / 1000

  defp logical_max_for_chart(list_of_byte_data) do
    max_data_point = Enum.max(list_of_byte_data)

    max_data_point
    |> find_next_logical_max()
  end

  defp find_next_logical_max(max) do
    num_digits =
      :math.log10(max)
      |> ceil()
      |> round()

    base_number =
      Integer.to_string(1)
      |> String.pad_trailing(num_digits, "0")
      |> String.to_integer()

    quartered = round(base_number / 4)

    Stream.unfold(quartered, fn
      n when n < max -> {n, n + quartered}
      _ -> nil
    end)
    |> Enum.to_list()
    |> Enum.reverse()
    |> List.first()
    |> Kernel.+(quartered)
  end
end
