defmodule ExampleAppCliTest do
  use ExUnit.Case
  doctest ExampleAppCli

  test "greets the world" do
    assert ExampleAppCli.hello() == :world
  end
end
