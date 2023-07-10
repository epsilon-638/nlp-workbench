defmodule StringApp.StringMethods do
  @spec upper(String.t) :: String.t
  def upper(word) do
    String.upcase(word)
  end

  @spec upperfile(String.t) :: String.t
  def upperfile(filepath) do
    case File.read(filepath) do
      {:ok, contents} ->
        String.upcase(contents)
      {:error, reason} ->
        "Error reading file: #{reason}"
    end
  end

  @spec lower(String.t) :: String.t
  def lower(word) do
    String.downcase(word)
  end

  def remove_punct(word) do
    pattern = ~r/[[:punct:]]/
    String.replace(word, pattern, "")
  end

  def remove_stopwords(contents) do
    pathname = Path.join(["grammars", "stopwords.txt"])
    stopwords = File.stream!(pathname)
      |> Stream.map(&String.trim/1)
      |> Enum.reduce(%{}, fn line, acc ->
        Map.put_new(acc, line, nil)
      end)

    Enum.reject(String.split(contents, " "), fn wd ->
      Map.has_key?(stopwords, String.trim(wd))
    end)
    |> Enum.join(" ")
  end

  @spec lowerfile(String.t) :: String.t
  def lowerfile(filepath) do
    case File.read(filepath) do
      {:ok, contents} ->
        String.downcase(contents)
      {:error, reason} ->
        "Error reading file: #{reason}"
    end
  end

  @spec pipe(list(String.t), String.t) :: String.t
  def pipe(pipeline_ops, content) do
    Enum.reduce(pipeline_ops, content, fn op, acc ->
      case op do
        "lowercase" -> lower(acc)
        "upper" -> upper(acc)
        "remove_punct" -> remove_punct(acc)
        "remove_stopwords" -> remove_stopwords(acc)
      end
    end)
  end

  @spec pipefile(list(String.t), String.t) :: String.t
  def pipefile(pipeline_ops, filepath) do
    case File.read(filepath) do
      {:ok, contents} ->
        pipe(pipeline_ops, contents)
      {:error, reason} ->
        "Error reading file: #{reason}"
    end
  end
end
