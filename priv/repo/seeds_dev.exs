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

alias RefPA2.{Repo, User, Elements}
alias RefPA2.Elements.{Node, Edge, Gateway, Group}
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


node1 = Elements.create_node(%{"name" => "An1", "modell" => "A", "caption" =>
  "Antrag annehmen", "external_participants" => "Bürger", "duration" => (5), "probability" => nil, "data_object" => "Antrag", "it_system" => nil, "p_value" => nil, "marked" => false})


node2 = Elements.create_node(%{"name" => "An2", "modell" => "A", "caption" =>
  "Antrag absenden", "external_participants" => "Bürger", "duration" => (5), "probability" => nil, "data_object" => "Antrag", "it_system" => nil, "p_value" => nil, "marked" => false})

gateway = Elements.create_node(%{"name" => "G1", "modell" => "A", "marked" => false})

Elements.create_edge(%{"name" => "E_An1_G1", "modell" => "A", "marked" => false}, node1, gateway)
Elements.create_edge(%{"name" => "E_An2_G2", "modell" => "A", "marked" => false}, node2, gateway)
