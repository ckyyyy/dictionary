defmodule Dictionary do
  @moduledoc """
  Documentation for `Dictionary`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Dictionary.hello()
      :world

  """

  def random_word do
    word_list()
    |> Enum.random()
  end

  def word_list do
    "assets/words.txt"
    |> File.read!()
    |> String.split(~r/\n/)
  end
end


defmodule PatternMatching do
  @doc """
  PatternMatching.func({ 10, 12 })
  a = 10, b = 12, true
  """
  def func(t = { a, b }) do
    IO.puts "a = #{a}, b = #{b}, #{is_tuple{t}}"
  end

  @doc """
  PatternMatching.test_read
  []
  """
  def test_read do
    "my_file.txt"
    |> File.open
    |> read_file
  end

  def read_file({ :ok, file }) do
    file
    |> IO.read(:line)
  end

  def read_file({ :error, reason }) do
    []
  end

  @doc """
  PatternMatching.tuple_swap({ 10, 4 })
  {4, 10}
  """
  def tuple_swap({a, b}) do
    {b, a}
  end

  @doc """
  PatternMatching.same({ "abc", "abc" })
  true
  """
  def same(a, a) do
    true
  end

  @doc """
  PatternMatching.same({ "abc", "cba" })
  false
  """
  def same(_, _) do
    false
  end

end


defmodule Lists do

  @doc """
  length [1,2,3]
  3
  """
  def len([]), do: 0
  def len([_h|t]), do: 1 + len(t)


  @doc """
  Enum.sum([1,2,3,4])
  10
  """
  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  def double([]), do: []
  def double([h|t]), do: [h*2 | double(t)]

  def square([]), do: []
  def square([h|t]), do: [h*h | square(t)]

  @doc """
  Lists.map([1,2,3], fn x -> 3*x end)
  [3,6,9]
  Lists.map([1,2,3], fn x -> x*x*x end)
  [1,8,27]
  Lists.map([1,2,3], &(&1*&1*&1))
  [1,8,27]
  Enum.map [1, 2, 3], fn (val) -> val*2 end
  [2,4,6]
  Enum.map([1,2,3], &(&1*4))
  [4,8,12]
  """
  def map([], _func), do: []
  def map([h|t], func) do
    [ func.(h) | map(t, func) ]
  end

  def sum_pairs([]), do: []
  def sum_pairs([h1, h2|t]), do: [h1+h2| sum_pairs(t)]
  @doc """
  to avoid error of a list with an odd length
  """
  def sum_pairs([_h1|_t]), do: []

  def even_length?([]), do: true
  def even_length?([_h1, _h2|t]), do: even_length?(t)
  def even_length?([_h1|t]), do: false

end
