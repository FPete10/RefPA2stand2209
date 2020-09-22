# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Klausurarchiv.Repo.insert!(%Klausurarchiv.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RefPA2.Repo
alias RefPA2.User
alias RefPA2.Elements.Node
alias RefPA2.Elements.Edge
alias RefPA2.Elements.Gateway
alias RefPA2.Elements.Group
import Ecto.Query, warn: false

user =
  User
  |> where([u], u.email == ^"tbho@tbho.de")
  |> Repo.one()

case user do
  nil ->
    User.create_user(%{"fore_name" => "Tobias", "last_name" => "Hoge", "user_name" => "tbho", "email" => "tbho@tbho.de", "password" => "Test123!", "password_confirmation" => "Test123!", "role" => "admin"})

  user ->
    user
end

case node do
  nil ->
    Node.create_node(%{"name" => "An1", "modell" => "A", "caption" => "Antrag annehmen", "external_participants" => "Bürger", "duration" => (5), "probability" => _, "data_object" => "Antrag", "it_system" => _, "p_value" => _, "marked" => false})

  node ->
    node
end
