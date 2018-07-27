class CvsController < ApplicationController
     #before_action :authenticate_admin!, except: [:new , :cv_complet]
      before_action :authenticate_admin!, only: [:index ]
  before_action :find_cv, only: [:edit, :update, :delete  ]
  
  def index

     @cvs = Cv.order('created_at DESC')
     @cvs = Cv.order(params[:sort],'created_at DESC')
  #  @cvs = Cv.all
   # if params[:search]
    #  @cvs = Cv.search(params[:search]).order("created_at DESC").find_by(degree_level: search)
    #else
     # @cvs =Cv.all.order('created_at DESC')
     # end
     if params[:search]
      @search_term= params[:search]
    @cvs = @cvs.search_by(@search_term).order('created_at DESC') 
    end
  #  @cvs = Cv.paginate(:page => params[:page], :per_page => 16).order('created_at DESC')
 
  end

  def edit
  end 

  def delete
  end

  def new
    @cv = Cv.new
  end

  def show
  end

  def download_file
      @resource = Cv.find(params[:id])
      send_file(@resource.upload_cv.path,
      :disposition => 'attachment',
      :type => "application/pdf || application/docx",
      :url_based_filename => false)
  end

  def create
      @cv = Cv.new(cv_params)
      if @cv.save
        flash[:notice] = "Cv Uploader. Thanks!"
        redirect_to cvs_cv_complet_path
      else
        render :new
     end
     #@cv=Cv.new(cv_doc_params)
      #if @cv.save
        #flash[:notice] = "Cv document Uploaded. Thanks!"
       # redirect_to cvs_cv_complet_path
      #else
     #   render :new
    # end
  end

def destroy
    cv = Cv.find(params[:id]).destroy
    flash[:notice] = "cv Deleted!!"
     # redirect_to cvs_path
  end

   def cv_params
    params.require(:cv).permit(:cv_title,:job_category,:institution_name,:field_of_study,:admission_year,:graduation_year,:degree_level,:job_title,:company_name,:start_date,:end_date,:type_of_organization,:skills,:upload_cv)
  end
 

def find_cv
      @cv = Cv.find(params[:id])
  end
 

end
