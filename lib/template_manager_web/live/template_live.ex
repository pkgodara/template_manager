defmodule TemplateManagerWeb.TemplateLive do
  use TemplateManagerWeb, :live_view
  alias TemplateManager.Prompts
  alias TemplateManager.Prompts.Template
  use Phoenix.Component

  @impl true
  def mount(_params, _session, socket) do
    templates = Prompts.list_templates()
    {:ok, assign(socket,
      templates: templates,
      new_template: Prompts.change_template(%Template{}),
      selected_template: nil,
      model_input: "",
      processed_prompt: nil
    )}
  end

  @impl true
  def handle_event("save", %{"template" => template_params}, socket) do
    case Prompts.create_template(template_params) do
      {:ok, _template} ->
        templates = Prompts.list_templates()
        {:noreply,
          socket
          |> assign(templates: templates, new_template: Prompts.change_template(%Template{}))
          |> put_flash(:info, "Template created successfully")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, new_template: changeset)}
    end
  end

  @impl true
  def handle_event("select-template", %{"id" => id}, socket) do
    template = Prompts.get_template!(id)
    {:noreply, assign(socket, selected_template: template, model_input: "", processed_prompt: nil)}
  end

  @impl true
  def handle_event("process", %{"model" => model}, %{assigns: %{selected_template: template}} = socket) do
    today = Calendar.strftime(DateTime.utc_now(), "%Y-%m-%d")
    processed = template.body
      |> String.replace("[[today]]", today)
      |> String.replace("[[model]]", model)

    {:noreply, assign(socket, processed_prompt: processed, model_input: model)}
  end

  @impl true
  def handle_event("clear-selection", _, socket) do
    {:noreply, assign(socket, selected_template: nil, model_input: "", processed_prompt: nil)}
  end
end
