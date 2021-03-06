defmodule Backend.GuardianSerializer do
  @moduledoc false
  @behaviour Guardian.Serializer

  alias Backend.{Repo, User}

  def for_token(%User{id: id}), do: {:ok, "User:#{id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  def from_token("User:" <> id), do: {:ok, Repo.get(User, id)}
  def from_token(_), do: {:error, "Unknown resource type"}
end
