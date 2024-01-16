defmodule TestDeferLoadNif do
  def load_nif() do
    nif_binary = Application.app_dir(:test_defer_load_nif, "priv/test_defer_load_nif")
    :erlang.load_nif(to_charlist(nif_binary), 0)
  end

  def test() do
    case load_nif() do
      :ok -> apply(__MODULE__, :test, [])
      {:error, {:reload, _}} -> apply(__MODULE__, :test, [])
      error -> error
    end
  end
end
