class ApplicationController < ActionController::Base
  before_action :authenticate_cliente!

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
	
	def render_404
		redirect_to main_app.root_url
	end
end
