defmodule TestDeferLoadNifTest do
  use ExUnit.Case
  doctest TestDeferLoadNif

  test "greets the world" do
    assert TestDeferLoadNif.hello() == :world
  end
end
