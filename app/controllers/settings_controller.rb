class SettingsController < AdminController
  def index
    @settings = Setting.all
  end

  def show
    @setting = Setting.find(params[:id])
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      flash[:success] = "Настройки успешно созданы"
      redirect_to settings_path
    else
      flash.now[:error] = "Ошибка создания настроек"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def update
    @setting = Setting.find(params[:id])

    if @setting.update(setting_params)
      flash[:success] = "Настройки успешно изменены"
      redirect_to setting_path(@setting)
    else
      flash.now[:error] = "Ошибка изменения настроек"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy

    flash.now[:success] = "Настройки успешно удалены"
    redirect_to contacts_path, status: :see_other
  end

  private

  def setting_params
    params.require(:setting).permit(
      :main_title, :main_subtitle, :main_email, :main_phone, :main_address, :main_button_text, :main_button_link,
      :block2_title, :block2_show,
      :block3_title, :block3_show, :block3_button_text, :block3_button_link,
      :block4_title, :block4_show, :block4_button_text, :block4_button_link,
      :block5_title, :block5_show,
      :block6_title, :block6_show, :block6_button_text, :block6_button_link,
      :block7_title, :block7_show, :block7_button_text, :block7_button_link,
      :contacts_show, :contacts_title, :contacts_map, :contacts_show_map
    )
  end
end
