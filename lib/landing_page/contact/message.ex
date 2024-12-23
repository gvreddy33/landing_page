defmodule LandingPage.Contact.Message do
  @moduledoc """
  Defines the schema and changeset for contact messages.

  This module represents a contact message in the portfolio application.
  It includes fields for the sender's name, email, subject, and the message body.
  The module also provides validation rules for these fields to ensure data integrity.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :name, :string
    field :email, :string
    field :message, :string

    timestamps(type: :utc_datetime)
  end

  @spec changeset(
          {map(),
           %{
             optional(atom()) =>
               atom()
               | {:array | :assoc | :embed | :in | :map | :parameterized | :supertype | :try,
                  any()}
           }}
          | %{
              :__struct__ => atom() | %{:__changeset__ => any(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :email, :message])
    |> validate_required([:name, :email, :message])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must be a valid email address")
    |> validate_length(:email, max: 160, message: "should be at most 160 characters")
    |> validate_length(:name, min: 2, max: 100, message: "should be between 2 and 100 characters")
    |> validate_length(:message, min: 5, max: 200, message: "should be between 5 and 200 characters")
    |> validate_format(:name, ~r/^[a-zA-Z\s'-]+$/, message: "should only contain letters, spaces, hyphens, and apostrophes")
  end
end
