class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @records = @user.records.order('created_at DESC').page(params[:page])
    @bench_records = @user.records.where(status: "ベンチプレス").order("created_at DESC").page(params[:page])
  end
  
  
  def squats
    @user = User.find(params[:id])
    @squat_records = @user.records.where(status: "スクワット").order("created_at DESC").page(params[:page])
  end
  
  def deads
    @user = User.find(params[:id])
    @dead_records = @user.records.where(status: "デッドリフト").order("created_at DESC").page(params[:page])
  end
end
