defmodule UserFromAuth do
  require Ecto.Query

  alias Ueberauth.Auth
  alias ShareHalf.User
  alias ShareHalf.Repo

  def find_or_create(%Auth{} = auth) do
    case Repo.one(Ecto.Query.where(User, facebook_id: ^auth.uid)) do
      nil ->
        changeset = User.changeset(%User{}, basic_info(auth))

        case Repo.insert(changeset) do
          {:ok, user} ->
            {:ok, user}
          {:error} ->
            {:error, "NO USER"}
        end
      user ->
        {:ok, user}
    end
  end

  defp basic_info(auth) do
    %{facebook_id: auth.uid, name: name_from_auth(auth), image: auth.info.image}
  end

  defp name_from_auth(auth) do
    if auth.info.name do
      auth.info.name
    else
      name = [auth.info.first_name, auth.info.last_name]
              |> Enum.filter(&(&1 != nil and &1 != ""))

      cond do
        length(name) == 0 -> auth.info.nickname
        true -> Enum.join(name, " ")
      end
    end
  end
end
