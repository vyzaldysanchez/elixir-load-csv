defmodule PushAppWeb.Employee do
    use Ecto.Schema

    @derive { Poison.Encoder, only: [
        :first_name,
        :last_name,
        :email,
        :charter,
        :bank_account,
        :payable_amount,
        :description
    ] }

    schema "employees" do
        field(:first_name, :string)
        field(:last_name, :string)
        field(:email, :string)
        field(:charter, :string)
        field(:bank_account, :string)
        field(:payable_amount, :string)
        field(:description, :string)

        timestamps()
    end
end