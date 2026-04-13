class Backoffice::AdsController < BackofficeController
  before_action :set_ad, only: %i[show edit update destroy]
  before_action :load_categories, only: %i[new create edit update]

  def index
    @ads = Ad.includes(:category).order(created_at: :desc)
  end

  def show
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)

    if @ad.save
      redirect_to backoffice_ad_path(@ad), notice: "Anúncio criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @ad.update(ad_params)
      redirect_to backoffice_ad_path(@ad), notice: "Anúncio atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ad.destroy
    redirect_to backoffice_ads_path, notice: "Anúncio removido com sucesso."
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def load_categories
    @categories = Category.order(:description)
  end

  def ad_params
    params.require(:ad).permit(:title, :description, :category_id)
  end
end
