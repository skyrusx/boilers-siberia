class SupportsController < AdminController
  def index
    @supports = Support.order("id ASC")
  end

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)

    if @support.save
      flash[:success] = "Элемент поддержки успешно создана"
      redirect_to supports_path
    else
      flash.now[:error] = "Ошибка создания элемента поддержки"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @support = Support.find(params[:id])
  end

  def update
    @support = Support.find(params[:id])

    if @support.update(support_params)
      flash[:success] = "Элемент поддержки успешно изменен"
      redirect_to supports_path
    else
      flash.now[:error] = "Ошибка изменения элемента поддержки"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @support = Support.find(params[:id])
    @support.destroy

    flash.now[:success] = "Элемент поддержки успешно удален"
    redirect_to supports_path, status: :see_other
  end

  private

  def support_params
    params.require(:support).permit(:title, :link, :file, :group_id)
  end
end
