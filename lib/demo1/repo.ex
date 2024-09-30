defmodule Demo1.Repo do
  use Ecto.Repo,
    otp_app: :demo1,
    adapter: Ecto.Adapters.SQLite3
end
