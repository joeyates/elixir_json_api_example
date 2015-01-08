defmodule JsonApiHelloTest do
  use ExUnit.Case

  setup do
    pid = spawn(JsonApi, :start, [])
    {:ok, [pid: pid]}
  end

  defp request(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        {:error, 404, body}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, :httpoison_error, reason}
    end
  end

  test "it succeeds", context do
    case request('http://localhost:8080/hello.json') do
      {:ok, _} ->
        assert(true)
      {:error, _} ->
        assert(false)
    end
  end

  test "it returns valid JSON" do
    {:ok, body} = request('http://localhost:8080/hello.json')
    data = Poison.Parser.parse!(body)
    assert data["hello"] == "world"
  end
end
