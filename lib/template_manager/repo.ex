defmodule TemplateManager.Repo do
  use Ecto.Repo,
    otp_app: :template_manager,
    adapter: Ecto.Adapters.Postgres
end
