class ContactsController < AdminController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:success] = "Контактные данные успешно созданы"
      redirect_to contacts_path
    else
      flash.now[:error] = "Ошибка создания контактных данных"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      flash[:success] = "Контактные данные успешно изменены"
      redirect_to contacts_path
    else
      flash.now[:error] = "Ошибка изменения контактных данных"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    flash.now[:success] = "Контактные данные успешно удалены"
    redirect_to contacts_path, status: :see_other
  end

  private

  def contact_params
    params.require(:contact).permit(:region, :representative, :address, :phone, :phone_other, :email,
                                    :working_hours_weekdays, :working_hours_weekends)
  end
end
