defmodule PushApp.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add(:first_name, :string)
      add(:last_name, :string)
      add(:email, :string)
      add(:charter, :string)
      add(:bank_account, :string)
      add(:payable_amount, :string)
      add(:description, :string)

      timestamps()
    end
  end
end
