defmodule Day1 do
  require HTTPoison

  def go do
    "input.txt"
    |> File.stream!
    |> Enum.map(&to_int/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(&increasing?/1)
    |> IO.inspect
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
