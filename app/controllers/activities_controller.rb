class ActivitiesController < AdminController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      flash[:success] = "Деятельность успешно создана"
      redirect_to activities_path
    else
      flash.now[:error] = "Ошибка создания деятельности"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update(activity_params)
      flash[:success] = "Деятельность успешно изменена"
      redirect_to activities_path
    else
      flash.now[:error] = "Ошибка изменения деятельности"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    flash.now[:success] = "Деятельность успешно удалена"
    redirect_to activities_path, status: :see_other
  end

  private

  def activity_params
    params.require(:activity).permit(:info, :icon)
  end
end
