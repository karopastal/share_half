defmodule ShareHalf.User do
  use ShareHalf.Web, :model

  schema "users" do
    field :name, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :image, :string
    field :location, :string
    field :nickname, :string
    field :phone, :string
    field :facebook_id, :string
    field :admin, :boolean

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :first_name, :last_name, :email, :image, :location, :nickname, :phone, :facebook_id, :admin])
    |> validate_required([:name, :facebook_id])
  end
end
