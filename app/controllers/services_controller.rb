class ServicesController < ApplicationController
	before_action :authenticate_admin!, except: [:index, :service_amh]
  before_action :find_service, only: [:edit, :update, :delete]
 
 def index
    @services = Service.order('created_at DESC')

  end

  def show_all
    @services = Service.all
     @services = Service.paginate(:page => params[:page], :per_page => 9).order('created_at DESC')
  end

  def edit
  end

  def new
  		@service = Service.new
  end

  def delete
  end

  def create
    @service = Service.new(service_params)
       if @service.save
        flash[:notice]="posted"
        redirect_to services_show_all_path
       else
        render :new
       end
  end

  def update
  			if @service.update_attributes(service_params)
  				flash[:notice]= "Succesfully Updated"
  				redirect_to services_show_all_path
  			else
  				render :edit
  			end
  end

  def destroy
  		service =Service.find(params[:id]).destroy
  		flash[:notice]= "Deleted"
  		redirect_to services_show_all_path
  end

def service_params
	params.require(:service).permit(:company_name, :position, :testimony )
end

def find_service
	@service = Service.find(params[:id])
	end
end
