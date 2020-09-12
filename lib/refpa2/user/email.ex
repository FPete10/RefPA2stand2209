defmodule RefPA2.User.Email do
  import Bamboo.Email
  import RefPA2Web.Gettext

  @doc "Creates a new email for user with password_reset_url and password_reset_token"
  @spec password_reset_email(User.t(), Token.t()) :: Email.t()
  def password_reset_email(user, token) do
    password_reset_url =
      RefPA2Web.Router.Helpers.public_password_reset_token_path(
        RefPA2Web.Endpoint,
        :show,
        token.token
      )

    new_email()
    |> to(user.email)
    |> from("support@deepmrt.de")
    |> subject(dgettext("email", "reset_password"))
    |> html_body(password_reset_url)
    |> text_body(password_reset_url)
  end
end
