defmodule RefPA2.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: RefPA2.Repo

  # def not_correct_signed_transaction_factory do
  #   %RefPA2.Blockchain.Transaction{
  #     id: Ecto.UUID.generate(),
  #     timestamp: Timex.now() |> Timex.format!("{ISO:Extended}"),
  #     data: Poison.encode!(%{"games" => [], "scores" => []}),
  #     signature: "test",
  #     block_index: nil,
  #     user_id: nil
  #   }
  # end

  # def private_user_factory do
  #   user_key = RefPA2.CryptoHelper.create_rsa_key()

  #   %RefPA2.User{
  #     user_name: "tbho"
  #   }
  #   |> RefPA2.User.change_user(%{
  #     "password" => @standard_password,
  #     "password_confirmation" => @standard_password,
  #     "private_key" => user_key.private_pem_string
  #   })
  #   |> Ecto.Changeset.apply_changes()
  # end

  # def private_user_gen_id_factory do
  #   %RefPA2.User{
  #     user_name: "tbho"
  #   }
  #   |> RefPA2.User.change_user(%{
  #     "password" => @standard_password,
  #     "password_confirmation" => @standard_password,
  #     "private_key" => ""
  #   })
  #   |> Ecto.Changeset.apply_changes()
  # end

  # def public_user_factory do
  #   user_key = RefPA2.CryptoHelper.create_rsa_key()

  #   %RefPA2.User{
  #     user_name: "tbho"
  #   }
  #   |> RefPA2.User.change_user(%{
  #     "public_key" => user_key.public_pem_string
  #   })
  #   |> Ecto.Changeset.apply_changes()
  # end

  # def server_factory do
  #   server_key = RefPA2.CryptoHelper.create_rsa_key()

  #   %RefPA2.Server{
  #     url: "https://test.de",
  #     public_key: server_key.public_pem_string,
  #     authority: false,
  #     id: server_key.id
  #   }
  # end

  # def this_server_factory do
  #   {:ok, private_key} = ExPublicKey.generate_key(4096)

  #   RefPA2.CryptoMock
  #   |> stub(:private_key, fn -> {:ok, private_key} end)

  #   %{public_pem_string: public_pem_string, id: id} =
  #     RefPA2.CryptoHelper.generate_fields_from_rsa_key(private_key)

  #   %RefPA2.Server{
  #     url: "https://tobiashoge.de",
  #     public_key: public_pem_string,
  #     authority: true,
  #     id: id
  #   }
  # end

  # def session_factory do
  #   %RefPA2.User.Session{
  #     user: build(:private_user),
  #     ip: "127.0.0.1",
  #     user_agent: "Test",
  #     access_token: "secret_access_token",
  #     access_token_issued_at: DateTime.utc_now(),
  #     refresh_token: "secret_refresh_token",
  #     refresh_token_issued_at: DateTime.utc_now()
  #   }
  # end

  # def block_factory do
  #   %RefPA2.Blockchain.Block{}
  #   |> RefPA2.Blockchain.Block.changeset_create(%{
  #     data:
  #       Poison.encode!(%{
  #         "propose" => [],
  #         "propose_response" => [],
  #         "transactions" => []
  #       }),
  #     pre_hash: "ZERO_HASH",
  #     index: 0,
  #     transactions: []
  #   })
  #   |> Ecto.Changeset.apply_changes()
  # end

  # def signed_block_factory(attrs) do
  #   %RefPA2.Blockchain.Block{}
  #   |> RefPA2.Blockchain.Block.changeset_create(%{
  #     data: attrs.data,
  #     pre_hash: attrs.block.hash,
  #     index: attrs.block.index + 1,
  #     transactions: attrs.transactions
  #   })
  #   |> Ecto.Changeset.apply_changes()
  # end
end
