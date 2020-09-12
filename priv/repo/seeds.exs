# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RefPA2.Repo.insert!(%RefPA2.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

require Logger

if System.get_env("ENV_NAME") != "production" do
  Code.eval_file(
    __ENV__.file
    |> Path.dirname()
    |> Path.join("seeds_dev.exs")
  )
end

Logger.info("Success!")
