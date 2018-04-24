defmodule LoggerStream do
  defstruct level: :info

  def new(level) do
    %LoggerStream{level: level}
  end

  defimpl Collectable do
    def into(%{level: level} = stream) do
      {:ok, log(stream, level)}
    end

    def log(stream, level) do
      fn
        :ok, {:cont, x} ->
          Logger.bare_log(level, fn -> String.trim(x) end)
        :ok, _ -> stream
      end
    end
  end
end
