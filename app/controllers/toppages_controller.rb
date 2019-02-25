class ToppagesController < ApplicationController
  def index
    if logged_in?
      @record = current_user.records.build  # form_for 用
      @records = Record.all.order('created_at DESC').page(params[:page])
    end
  end
end
