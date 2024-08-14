defmodule Warehouse do
  use Application

  def start(_type, _args) do
    children = [
      Supervisor.child_spec({Warehouse.Receiver, []}, id: :receiver),
      Supervisor.child_spec({Warehouse.DeliveratorPool, []}, id: :deliverator_pool)
    ]

    Supervisor.start_link(children, strategy: :one_for_all, name: Warehouse.Supervisor)
  end
end
