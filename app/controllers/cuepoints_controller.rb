# CuePoint コントローラ
class CuepointsController < ApplicationController
  # 一覧
  def index
    # TODO
    @cuepoints = Cuepoint.all
  end

  # 新規
  def new
    # TODO
     @cuepoint= Cuepoint.new
  end

  # 作成
  def create
    # TODO
    @cuepoint = Cuepoint.new(cuepoint_params)

    if @cuepoint.save
      flash[:success] = 'Cuepoint が正常に投稿されました'
      redirect_to cuepoints_path
    else
      flash.now[:danger] = 'Cuepoint が投稿されませんでした'
      render :new
    end
  end

  # 編集
  def edit
    # TODO
     @cuepoint = Cuepoint.find(params[:id])
     
  end

  # 更新
  def update
    # TODO
     @cuepoint = Cuepoint.find(params[:id])

    if @cuepoint.update(cuepoint_params)
      flash[:success] = 'Cuepoint は正常に更新されました'
      redirect_to cuepoints_url
    else
      flash.now[:danger] = 'Cuepoint は更新されませんでした'
      render :edit
    end
  end

  # 削除
  def destroy
    # TODO
    @cuepoint = Cuepoint.find(params[:id])
    @cuepoint.destroy

    flash[:success] = 'Cuepoint は正常に削除されました'
    redirect_to cuepoints_url
  end

  private
    # キューポイント用パラメータ
    def cuepoint_params
      # TODO
      params.require(:cuepoint).permit(:name)
    end
end