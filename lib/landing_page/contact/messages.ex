defmodule LandingPage.Contact.Messages do
  alias LandingPage.Contact.Message
  alias LandingPage.Repo

  def change_message(message \\ %Message{}) do
    Message.changeset(message, %{})
  end
  def create_message(attrs \\ %{}) do
    %Message{}                 # Create a new Message struct
    |> Message.changeset(attrs) # Apply validations using changeset
    |> Repo.insert()            # Save the data to the database
  end
end
