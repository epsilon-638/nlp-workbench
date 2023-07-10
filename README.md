# NLP Workbench

**A CLI for doing quick NLP tasks**

## Quickstart
```bash
git clone git@github.com:epsilon-638/nlp-workbench.git
cd nlp-workbench
mix escript.build
./nlp_workbench --pipeline=lowercase,remove_stopwords "THIS IS A QUICK EXAMPLE"
```

Output
```
quick example
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `example_app_cli` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:example_app_cli, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/example_app_cli>.

