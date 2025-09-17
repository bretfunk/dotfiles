# Enhanced IEx Configuration for Elixir Development
# Enables ANSI colors and sets up productive helpers

Application.put_env(:elixir, :ansi_enabled, true)

# Utility helper functions for IEx productivity
defmodule IExHelpers do
  @doc "Clear the screen"
  def cls, do: IO.puts("\e[2J\e[H")

  @doc "Restart the current application"
  def restart do
    case Mix.Project.config()[:app] do
      nil ->
        IO.puts("No Mix project found")
      app ->
        Mix.Task.reenable("compile.elixir")
        Application.stop(app)
        Mix.Task.run("compile.elixir")
        Application.start(app)
        IO.puts("#{app} restarted successfully")
    end
  end

  @doc "Quick exit function like Erlang's q()"
  def q, do: System.halt(0)

  @doc "Get type information about any term"
  def whats_this?(term) when is_nil(term), do: "Type: Nil"
  def whats_this?(term) when is_binary(term), do: "Type: Binary (String)"
  def whats_this?(term) when is_boolean(term), do: "Type: Boolean"
  def whats_this?(term) when is_atom(term), do: "Type: Atom"
  def whats_this?(term) when is_integer(term), do: "Type: Integer"
  def whats_this?(term) when is_float(term), do: "Type: Float"
  def whats_this?(term) when is_list(term), do: "Type: List"
  def whats_this?(term) when is_map(term), do: "Type: Map"
  def whats_this?(term) when is_tuple(term), do: "Type: Tuple"
  def whats_this?(term) when is_pid(term), do: "Type: PID"
  def whats_this?(term) when is_function(term), do: "Type: Function"
  def whats_this?(_term), do: "Type: Unknown"

  @doc "Pretty print process info"
  def pinfo(pid \\ self()) when is_pid(pid) do
    case Process.info(pid) do
      nil -> IO.puts("Process not found")
      info ->
        info
        |> Enum.sort()
        |> IO.inspect(pretty: true, limit: :infinity)
    end
  end

  @doc "List all applications"
  def apps do
    Application.loaded_applications()
    |> Enum.map(&elem(&1, 0))
    |> Enum.sort()
    |> IO.inspect(pretty: true)
  end

  @doc "Get current timestamp"
  def timestamp do
    {_date, {hour, minute, second}} = :calendar.local_time()
    [hour, minute, second]
    |> Enum.map(&String.pad_leading(Integer.to_string(&1), 2, "0"))
    |> Enum.join(":")
  end
end

# Import helper functions into IEx
import IExHelpers

# Enhanced IEx configuration with improved colors and settings
IEx.configure(
  history_size: 1000,
  width: 120,
  inspect: [
    custom_options: [sort_maps: true],
    pretty: true,
    limit: 50,
    width: 120,
    charlists: :as_lists,
    structs: true,
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :green,
      boolean: [:light_blue],
      nil: [:magenta, :bright],
      regex: [:yellow, :bright],
      map: :light_blue,
      list: :white,
      tuple: :light_magenta
    ]
  ],
  colors: [
    enabled: true,
    eval_result: [:cyan, :bright],
    eval_error: [:red, :bright],
    eval_info: [:yellow],
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :green,
      boolean: [:light_blue],
      nil: [:magenta, :bright],
      regex: [:yellow, :bright]
    ],
    ls_directory: [:cyan, :bright],
    ls_device: [:yellow, :bright],
    doc_code: [:green, :bright],
    doc_inline_code: [:magenta, :bright],
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline],
    doc_bold: [:bright],
    doc_underline: [:underline]
  ],
  default_prompt: "#{IO.ANSI.blue}🚀#{IO.ANSI.reset} " <>
                  "#{IO.ANSI.light_cyan}iex#{IO.ANSI.reset}" <>
                  "#{IO.ANSI.light_black}(%counter)#{IO.ANSI.reset}> ",
  alive_prompt: "#{IO.ANSI.blue}🚀#{IO.ANSI.reset} " <>
                "#{IO.ANSI.light_cyan}%node#{IO.ANSI.reset}" <>
                "#{IO.ANSI.light_black}(%counter)#{IO.ANSI.reset}> "
)

# Welcome message
IO.puts """
#{IO.ANSI.cyan}#{IO.ANSI.bright}
╔══════════════════════════════════════════════════╗
║               🚀 Enhanced IEx Shell              ║
║                                                  ║
║ Helper functions available:                      ║
║   cls()          - Clear screen                  ║
║   restart()      - Restart current app          ║
║   q()            - Quick exit                    ║
║   whats_this?(x) - Get type info                 ║
║   pinfo(pid)     - Process info                  ║
║   apps()         - List applications             ║
║   timestamp()    - Current time                  ║
║                                                  ║
║ Enhanced with better colors & productivity!      ║
╚══════════════════════════════════════════════════╝
#{IO.ANSI.reset}
"""
