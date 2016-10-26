defmodule ShareHalf.UserTest do
  use ShareHalf.ModelCase

  alias ShareHalf.User

  @valid_attrs %{email: "some content", facebook_id: "some content", first_name: "some content", image: "some content", last_name: "some content", location: "some content", name: "some content", nickname: "some content", phone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
