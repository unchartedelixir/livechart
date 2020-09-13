defmodule Demo.SystemData do
  @moduledoc """
  Fetches system data from :erlang.system_data
  and presents it for use with a LiveChart.
  """

  def allocated_areas do
    :allocated_areas
    |> :erlang.system_info()
    |> format_data()
    |> Enum.filter(fn {_, kilobytes} -> kilobytes < 1000 && kilobytes > 100 end)
  end

  def chart_max(allocated_areas) do
    allocated_areas
    |> Enum.map(fn {_, bytes} ->
      bytes
    end)
    |> logical_max_for_chart()
  end

  defp format_data(allocated_areas) do
    allocated_areas
    |> Enum.map(fn area ->
      case area do
        {name, bytes} -> {atom_name_to_string(name), bytes_to_kilobytes(bytes)}
        {name, bytes, _} -> {atom_name_to_string(name), bytes_to_kilobytes(bytes)}
        _ -> nil
      end
    end)
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
