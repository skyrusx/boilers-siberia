class ProductsController < AdminController
  skip_before_action :authenticate_user!, only: [:show]
  layout "application", only: :show

  def index
    @products = Product.where(product_type: Product::TYPES[params[:type].to_sym])
  end

  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.where(product_id: @product.id, order_id: current_order.id).first
    unless @order_item.present?
      @order_item = current_order.order_items.new
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Товар '#{@product.title}' успешно создан"
      redirect_to products_path(type: params[:type])
    else
      flash.now[:error] = "Ошибка создания товара '#{@product.title}'"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:success] = "Товар '#{@product.title}' успешно изменен"
      redirect_to products_path(type: params[:type])
    else
      flash.now[:error] = "Ошибка изменения товара '#{@product.title}'"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash.now[:success] = "Товар успешно удален"
    redirect_to products_path(type: params[:type]), status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:title, :old_price, :price, :description, :sku, :product_type, :image)
  end
end
