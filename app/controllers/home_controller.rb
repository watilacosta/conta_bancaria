class HomeController < ApplicationController
  skip_before_action :authenticate_cliente!

  def index
    # @conta = current_cliente.conta if current_cliente
  end
end
