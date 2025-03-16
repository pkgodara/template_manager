defmodule TemplateManager.Prompts.Template do
  use Ecto.Schema
  import Ecto.Changeset

  schema "templates" do
    field :name, :string
    field :body, :string

    timestamps()
  end

  def changeset(template, attrs) do
    template
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
