Application.put_env(:elixir, :ansi_enabled, true)

timestamp = fn ->
  {_date, {hour, minute, _second}} = :calendar.local_time()
  [hour, minute]
  |> Enum.map(&(String.pad_leading(Integer.to_string(&1), 2, "0")))
  |> Enum.join(":")
end

IEx.configure(
  width: 80,
  inspect: [
    custom_options: [sort_maps: true],
    pretty: true,
    limit: :infinity,
    width: 80,
  ],
  colors: [
    eval_result: [:cyan, :bright],
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :light_black,
      boolean: [:light_blue],
      nil: [:magenta, :bright]
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline]
  ],

  # pretty sure this was causing errors

  # default_prompt: IO.ANSI.format([
  #   "\e[G",            # ANSI CHA, move cursor to column 1
  #   :light_magenta,
  #   "🧪 iex",          # plain string
  #   ">",
  #   :white,
  #   :reset
  # ]) |> IO.iodata_to_binary()

  default_prompt: IO.ANSI.format([
    :blue,
    "🚀 iex",       # Use a rocket emoji with the text "iex"
    "> ",
    :reset
  ]) |> List.to_string()
)
