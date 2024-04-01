class AdvantagesController < AdminController
  def index
    @advantages = Advantage.order("id ASC")
  end

  def new
    @advantage = Advantage.new
  end

  def create
    @advantage = Advantage.new(advantage_params)

    if @advantage.save
      flash[:success] = "Рекомендация '#{@advantage.title}' успешно создана"
      redirect_to advantages_path
    else
      flash.now[:error] = "Ошибка создания рекомендации '#{@advantage.title}'"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @advantage = Advantage.find(params[:id])
  end

  def update
    @advantage = Advantage.find(params[:id])

    if @advantage.update(advantage_params)
      flash[:success] = "Рекомендация '#{@advantage.title}' успешно изменена"
      redirect_to advantages_path
    else
      flash.now[:error] = "Ошибка изменения рекомендации '#{@advantage.title}'"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @advantage = Advantage.find(params[:id])
    @advantage.destroy

    flash.now[:success] = "Рекомендация успешно удалена"
    redirect_to advantages_path, status: :see_other
  end

  private

  def advantage_params
    params.require(:advantage).permit(:title, :description)
  end
end
