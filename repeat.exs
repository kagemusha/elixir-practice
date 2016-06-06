defmodule Macros do
  defmacro repeat(num, do: block) do
    quote do
      for i <- 1..unquote(num) do
        unquote(block)
      end
    end
  end

  defmacro repeat_if(num, if: cond, do: block) do
    quote do
      for i <- 1..unquote(num) do
        if unquote(cond) do
          unquote(block)
        end
      end
    end
  end
end