class BonusesController < AdminController
  def index
    @bonuses = Bonuse.all
  end

  def new
    @bonus = Bonuse.new
  end

  def create
    @bonus = Bonuse.new(bonus_params)

    if @bonus.save
      flash[:success] = "Бонус успешно создан"
      redirect_to bonuses_path
    else
      flash.now[:error] = "Ошибка создания бонуса"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bonus = Bonuse.find(params[:id])
  end

  def update
    @bonus = Bonuse.find(params[:id])

    if @bonus.update(bonus_params)
      flash[:success] = "Бонус успешно изменен"
      redirect_to bonuses_path
    else
      flash.now[:error] = "Ошибка изменения бонуса"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bonus = Bonuse.find(params[:id])
    @bonus.destroy

    flash.now[:success] = "Бонус успешно удален"
    redirect_to bonuses_path, status: :see_other
  end

  private

  def bonus_params
    params.require(:bonuse).permit(:text, :show_text, :banner)
  end
end
