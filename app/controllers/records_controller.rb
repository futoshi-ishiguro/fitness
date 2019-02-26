class RecordsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @record = current_user.records.build(record_params)
    if @record.save
      flash[:success] = '記録しました。'
      redirect_to root_url
    else
      @records = current_user.records.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '記録に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @record.destroy
    flash[:success] = '記録を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def record_params
    params.require(:record).permit(:status, :record)
  end
  
  def correct_user
    @record = current_user.records.find_by(id: params[:id])
    unless @record
      redirect_to root_url
    end
  end
end