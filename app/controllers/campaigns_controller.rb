# キャンペーン用コントローラ
class CampaignsController < ApplicationController
  # 一覧表示
  def index
    unless params[:cuepoint_id]
      # TODO
      @campaigns = Campaign.all
    else
      # 下記はVAST URL呼び出しを想定
      @cuepoint = Cuepoint.find(params[:cuepoint_id])
      @campaigns = Campaign.current_avaliable(@cuepoint)
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
    end
  end

  # 新規
  def new
    # TODO
     @campaign = Campaign.new
  end

  # 作成
  def create
    # TODO
    @campaign = Campaign.new(campaign_params) 

    if @campaign.save
      flash[:success] = 'Campaign が正常に投稿されました'
      redirect_to campaigns_path
    else
      flash.now[:danger] = 'Campaign が投稿されませんでした'
      render :new
    end
  end

  # 編集
  def edit
    # TODO
    @campaign = Campaign.find(params[:id])
  end

  # 更新
  def update
    # TODO
    @campaign = Campaign.find(params[:id])

    if @campaign.update(campaign_params)
      flash[:success] = 'Campaignは正常に更新されました'
      redirect_to campaigns_url
    else
      flash.now[:danger] = 'Campaign は更新されませんでした'
      render :edit
    end
  end

  # 削除
  def destroy
    # TODO
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    flash[:success] = 'Campaign は正常に削除されました'
    redirect_to campaigns_url
  end

  private
    # キャンペーン用パラメータ
    def campaign_params
      # TODO
      params.require(:campaign).permit(:name, :start_at, :end_at, :limit_start, :movie_url, cuepoint_ids: [])
    end
end