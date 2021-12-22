defmodule Identiconapi.Repo do
  use Ecto.Repo,
    otp_app: :identiconapi,
    adapter: Ecto.Adapters.Postgres
end
