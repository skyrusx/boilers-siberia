class SocialLinksController < AdminController
  def index
    @links = SocialLink.order("id ASC")
  end

  def new
    @link = SocialLink.new
  end

  def create
    @link = SocialLink.new(social_link_params)

    if @link.save
      flash[:success] = "Социальная ссылка '#{@link.title}' успешно создана"
      redirect_to social_links_path
    else
      flash.now[:error] = "Ошибка создания социальной ссылки '#{@link.title}'"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @link = SocialLink.find(params[:id])
  end

  def update
    @link = SocialLink.find(params[:id])

    if @link.update(social_link_params)
      flash[:success] = "Социальная ссылка '#{@link.title}' успешно изменена"
      redirect_to social_links_path
    else
      flash.now[:error] = "Ошибка изменения социальной ссылки '#{@link.title}'"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link = SocialLink.find(params[:id])
    @link.destroy

    flash.now[:success] = "Социальная ссылка успешно удалена"
    redirect_to social_links_path, status: :see_other
  end

  private

  def social_link_params
    params.require(:social_link).permit(:title, :link)
  end
end
