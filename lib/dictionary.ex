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
    Enum.random(word_list())
  end

  def word_list do
    content = File.read!("assets/words.txt")
    list = String.split(content, ~r/\n/)
  end
end
