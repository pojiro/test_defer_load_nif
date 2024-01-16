defmodule TestDeferLoadNifTest do
  use ExUnit.Case

  test "load_nif/0" do
    assert :ok = TestDeferLoadNif.load_nif()
    assert {:error, {:reload, _}} = TestDeferLoadNif.load_nif()
    assert {:error, {:reload, _}} = TestDeferLoadNif.load_nif()
  end

  test "test/0" do
    # Try to hit the race by having 32 processes race to load the NIF
    tasks =
      for _ <- 0..31 do
        Task.async(fn ->
          :ok = TestDeferLoadNif.test()
        end)
      end

    Enum.each(tasks, &Task.await/1)
  end
end
