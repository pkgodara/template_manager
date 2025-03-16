defmodule TemplateManager.Repo.Migrations.CreateTemplates do
  use Ecto.Migration

  def change do
    create table(:templates) do
      add :name, :string
      add :body, :text

      timestamps()
    end
  end
end
