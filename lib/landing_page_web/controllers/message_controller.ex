defmodule LandingPageWeb.MessageController do
  use LandingPageWeb, :controller
  alias LandingPage.Contact.Messages

  def new(conn, _params) do
    changeset = Messages.change_message()
    render(conn,"new.html", changeset: changeset)
  end

  def create(conn, %{"message" => message_params}) do
    IO.inspect(message_params, label: "Received Message Params")

    case LandingPage.Contact.Messages.create_message(message_params) do
      {:ok, _message} ->
        IO.puts("Message created successfully!")
        conn
        |> put_flash(:info, "We appreciate your interest! Expect to hear from us soon.")
        |> redirect(to: "/")

      {:error, changeset} ->
        IO.inspect(changeset.errors, label: "Changeset Errors")
        conn
        |> put_flash(:error, "Failed to send the message.")
        |> render("new.html", changeset: changeset)
    end
  end
end
