class HomeController < ApplicationController
  skip_before_action :authenticate_cliente!

  def index
  end
end
