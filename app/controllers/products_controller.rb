class ProductsController < RankingController

  before_action :authenticate_user!, only: :search

  def index
    # productsテーブルから最新順に作品を２０件取得する
    @products = Product.order("id ASC").limit(20)
    @contents = ["動画配信サービス", "映画賞", "上映中の映画", "公開予定の映画", "今週公開予定の映画", "レンタル新作", "レンタル開始予定", "制作年", "制作国", "ジャンル"]
  end

  def show
    # productsテーブルから該当するidの作品情報を取得し@productの変数へ代入する処理を書いて下さい
    @product =  Product.find_by(id: params[:id])
  end

  def search
    # 検索フォームのキーワードをあいまい検索して、productsテーブルから20件の作品情報を取得する
    @products = Product.where("title LIKE(?)","%#{params[:keyword]}%").limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end
end
