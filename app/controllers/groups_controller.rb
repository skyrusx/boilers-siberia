class GroupsController < AdminController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:success] = "Группа '#{@group.title}' успешно создана"
      redirect_to groups_path
    else
      flash.now[:error] = "Ошибка создания группы '#{@group.title}'"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      flash[:success] = "Группа '#{@group.title}' успешно изменена"
      redirect_to groups_path
    else
      flash.now[:error] = "Ошибка изменения группы '#{@group.title}'"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    flash.now[:success] = "Группа успешно удалена"
    redirect_to groups_path, status: :see_other
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end
end
