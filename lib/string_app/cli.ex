defmodule StringApp.Cli do
  @moduledoc """
  Documentation for `StringApp.Cli`.
  """
  def main(args \\ []) do
    args
    |> parse_args()
    |> response()
    |> IO.puts()
  end

  defp parse_args(args) do
    {opts, word, _} =
      args
      |> OptionParser.parse(switches: [
        upcase: :boolean,
        lowercase: :boolean,
        filepath: :string,
        pipline: :string,
      ])

    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    case {
      opts[:upcase],
      opts[:lowercase],
      opts[:filepath],
      opts[:pipeline]
    } do
      {true, _, fp, _} ->
        case fp == nil do
          true -> StringApp.StringMethods.upper(word)
          false -> StringApp.StringMethods.upperfile(fp)
        end

      {_, true, fp, _} ->
        case fp == nil do
          true -> StringApp.StringMethods.lower(word)
          false -> StringApp.StringMethods.lowerfile(fp)
        end
      {_, _, fp, pipeline} ->
        case {fp == nil, pipeline == nil} do
          {false, false} ->
            pipeline_ops = String.split(pipeline, ",")
            StringApp.StringMethods.pipefile(pipeline_ops, fp)

          {true, false} ->
            pipeline_ops = String.split(pipeline, ",")
            StringApp.StringMethods.pipe(pipeline_ops, word)

        end
    end
  end
end
