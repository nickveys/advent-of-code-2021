defmodule Day1 do

  def go do
    IO.puts("Part 1: #{part1()}")
    IO.puts("Part 2: #{part2()}")
  end

  defp part1 do
    "input-1.txt"
    |> File.stream!
    |> Enum.map(&to_int/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(&increasing?/1)
  end

  defp part2 do
    "input-1.txt"
    |> File.stream!
    |> Enum.map(&to_int/1)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(&increasing?/1)
  end

  defp increasing?([left, right]) do
    left < right
  end

  defp to_int(raw) do
    raw
    |> String.trim
    |> String.to_integer
  end

end
