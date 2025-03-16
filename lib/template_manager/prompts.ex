defmodule TemplateManager.Prompts do
  alias TemplateManager.Repo
  alias TemplateManager.Prompts.Template

  def list_templates do
    Repo.all(Template)
  end

  def get_template!(id), do: Repo.get!(Template, id)

  def create_template(attrs \\ %{}) do
    %Template{}
    |> Template.changeset(attrs)
    |> Repo.insert()
  end

  def update_template(%Template{} = template, attrs) do
    template
    |> Template.changeset(attrs)
    |> Repo.update()
  end

  def delete_template(%Template{} = template) do
    Repo.delete(template)
  end

  def change_template(%Template{} = template, attrs \\ %{}) do
    Template.changeset(template, attrs)
  end
end
