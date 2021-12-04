defmodule Day3 do

  def go do
    IO.puts("Part 1: #{part1()}")
  end

  defp part1 do
    "input-3.txt"
    |> File.stream!
    |> Enum.map(&parse_line/1)
    |> transpose
    |> Enum.map(&to_frequencies/1)
    |> Enum.map(&to_rate_pair/1)
    |> transpose
    |> Enum.map(&Enum.join/1)
    |> Enum.map(&(:erlang.binary_to_integer(&1, 2)))
    |> Enum.reduce(&Kernel.*/2)
  end

  defp parse_line(line) do
    line
    |> String.trim
    |> String.codepoints
    |> Enum.map(&String.to_integer/1)
  end

  defp to_frequencies(row) do
    Enum.frequencies(row)
  end

  defp to_rate_pair(%{0 => zeroes, 1 => ones}) do
    if zeroes > ones, do: [0, 1], else: [1, 0]
  end

  defp transpose(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

end
