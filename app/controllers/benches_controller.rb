class BenchesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @bench = current_user.benches.build(bench_params)
    if @bench.save
      flash[:success] = 'ベンチプレスの記録を登録しました。'
      redirect_to root_url
    else
      @benches = current_user.benches.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'ベンチプレスの記録の登録に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @bench.destroy
    flash[:success] = 'ベンチプレスの記録を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def bench_params
    params.require(:bench).permit(:bench_record)
  end
  
  def correct_user
    @bench = current_user.benches.find_by(id: params[:id])
    unless @bench
      redirect_to root_url
    end
  end
end