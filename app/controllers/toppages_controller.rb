class ToppagesController < ApplicationController
  def index
    if logged_in?
      @bench = current_user.benches.build  # form_for 用
      @benches = current_user.benches.order('created_at DESC').page(params[:page])
    end
  end
end
