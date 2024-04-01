class ReviewsController < AdminController
  def index
    @reviews = Review.order("id ASC")
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Отзыв успешно создана"
      redirect_to reviews_path
    else
      flash.now[:error] = "Ошибка создания отзыва"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:success] = "Отзыв успешно изменен"
      redirect_to reviews_path
    else
      flash.now[:error] = "Ошибка изменения отзыва"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    flash.now[:success] = "Отзыв успешно удален"
    redirect_to reviews_path, status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:name, :text, :link, :avatar)
  end
end
