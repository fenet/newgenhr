class VacanciesController < ApplicationController
   before_action :authenticate_admin!, except: [:index]
  before_action :find_vacancy, only: [:edit, :update, :delete]
  def index
     @vacancies = Vacancy.order('created_at DESC')
     @vacancies = Vacancy.paginate(:page => params[:page], :per_page => 9).order('created_at DESC')
  end 

  def edit
  end

  def new
       @vacancy = current_admin.vacancies.build
  end

  def delete
  end 
 
  def create
      @vacancy = current_admin.vacancies.build(vacancy_params)
      if @vacancy.save
        flash[:notice] = "vacancy posted. Thanks!"
        redirect_to vacancies_path
      else
        render :new
     end
  end

  def update
       if @vacancy.update_attributes(vacancy_params)
      flash[:notice] = "Successfully Vacancy Updated!!"
      redirect_to vacancies_path
     else
      render :edit 
   end
  end

  def destroy
    vacancy = Vacancy.find(params[:id]).destroy
    flash[:notice] = "Vacancy Deleted!!"
    redirect_to vacancies_path
  end
  
  def vacancy_params
    params.require(:vacancy).permit(:vacancy_detail,:vacancy_catagory,:vacancy_location,:vacancy_photo)
  end

  def find_vacancy
      @vacancy = Vacancy.find(params[:id])
  end

end
