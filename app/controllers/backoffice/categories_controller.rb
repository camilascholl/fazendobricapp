class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.order(:description)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to backoffice_category_path(@category), notice: "Categoria criada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to backoffice_category_path(@category), notice: "Categoria atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.destroy
      redirect_to backoffice_categories_path, notice: "Categoria removida com sucesso."
    else
      redirect_to backoffice_categories_path, alert: @category.errors.full_messages.to_sentence.presence || "Não foi possível remover a categoria."
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:description)
  end
end
