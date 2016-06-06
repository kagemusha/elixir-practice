defmodule Game do
  @callback status :: String

  @callback players :: List
end