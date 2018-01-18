defmodule PushAppWeb.PageController do
  use PushAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def payment(conn, params) do
    {:ok, content} = File.read(params["payment"]["file"].path)
    [meta, fields | data] = String.split(content, ~r{\r\n}, [trim: true])
    [ _, _, _, amount | _ ] = String.split(meta, ~r{,}, [trim: true])
    fields = String.split(fields, ~r{,}, [trim: true]) |> Enum.map(&String.to_atom/1)

    if Decimal.new(amount) != get_total_payment(data)  do
      render conn, "error.html"
    else
      data
      |> Enum.each(fn empl ->
        values = String.split(empl, ~r{,}, [trim: true])

        %{
          bank_account: bank_account,
          charter: charter,
          description: description,
          email: email,
          first_name: first_name,
          last_name: last_name,
          payable_amount: payable_amount
        } = Enum.zip(fields, values)
        |> Enum.into(%{})

        employee = %PushAppWeb.Employee{
          bank_account: bank_account,
          charter: charter,
          description: description,
          email: email,
          first_name: first_name,
          last_name: last_name,
          payable_amount: payable_amount
        }

        PushApp.Repo.insert!(employee)
      end)

      render conn, "index.html"
    end
  end

  defp get_total_payment(data) do
    Enum.reduce(data, Decimal.new(0.0), fn(empl, acc) ->
      {:ok, total} = String.split(empl, ~r{,}, [trim: true])
      |> List.last
      |> Decimal.parse

      IO.inspect acc

      Decimal.add(total, acc)
    end)
  end
end
