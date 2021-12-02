defmodule Day2 do

  def go do
    IO.puts("Part 1: #{part1()}")
    IO.puts("Part 2: #{part2()}")
  end

  defp part1 do
    "input.txt"
    |> File.stream!
    |> Enum.map(&to_tuple/1)
    |> Enum.reduce([0, 0], &process_line/2)
    |> Enum.reduce(&Kernel.*/2)
  end

  defp part2 do
    "input.txt"
    |> File.stream!
    |> Enum.map(&to_tuple/1)
    |> Enum.reduce([0, 0, 0], &process_aimed_line/2)
    |> multiply_part_2
  end

  defp to_tuple(line) do
    line
    |> String.split
    |> parse_tuple
  end

  defp parse_tuple([direction, quantity]) do
    [String.to_atom(direction), String.to_integer(quantity)]
  end

  defp process_line([:forward, qty], [position, depth]), do: [position + qty, depth]
  defp process_line([:down, qty], [position, depth]), do: [position, depth + qty]
  defp process_line([:up, qty], [position, depth]), do: [position, depth - qty]

  defp process_aimed_line([:forward, qty], [position, depth, aim]) do
    [position + qty, depth + (qty * aim), aim]
  end
  defp process_aimed_line([:down, qty], [position, depth, aim]) do
    [position, depth, aim + qty]
  end
  defp process_aimed_line([:up, qty], [position, depth, aim]) do
    [position, depth, aim - qty]
  end

  defp multiply_part_2([pos, depth, _aim]), do: pos * depth

end
