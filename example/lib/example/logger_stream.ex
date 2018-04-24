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
        :ok, {:cont, logs} ->
          logs
          |> String.split("\n")
          |> Enum.each(&Logger.bare_log(level, fn -> &1 end))
        :ok, _ -> stream
      end
    end
  end
end
