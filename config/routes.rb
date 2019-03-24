Rails.application.routes.draw do
  
# get 'feedbacks/index'

# get 'feedbacks/new'

# get 'feedbacks/edit'

#  get 'feedbacks/delete'

# get 'feedbacks/show'
   get 'services/service_amh'
#
#  get 'cvs/index'
#
#  get 'cvs/edit'
#
#  get 'cvs/delete'
#
#  get 'cvs/new'
#
#  get 'cvs/show'
#
  get 'ad_page/index'
#
  get 'services/show_all'
#
  get 'static_pages/aboutus'
#
get 'static_pages/operation'
#
#
get 'static_pages/current_operation'

#  get 'contacts/delete'
#
#  get 'contacts/edit'
#
#  get 'contacts/index'

# get 'contacts/show_com'

  get 'contacts/show'

  get 'static_pages/faqs'

  get 'static_pages/home_amh'

  get 'static_pages/Amharic'


# get 'cvs/show'
#
#  get 'vacancies/index'
#
#  get 'vacancies/edit'
#
#  get 'vacancies/new'
#
#  get 'vacancies/delete'
#
#  get 'vacancies/show' 
  
  get 'cvs/cv_complet'

  get 'feedbacks/thank_you'

 # get 'cvs/search' ,  to: "vcs#search" , as: :search

  resources :blogs, except: [:show] do
    member do
       get :delete
     end
  end


  resources :items, except: [:show] do
    member do
       get :delete
       put "like" => "items#vote"
     end
  end

  resources :cvs, except: [:show] do
    member do
       get :delete , :download_file
     
     end
  end

   resources :services, except: [:show] do
    member do
       get :delete
      end
  end
 

   resources :vacancies, except: [:show] do
    member do
       get :delete
     end
  end

resources :contacts, except: [:show] do
    member do
       get :delete
     
     end
  end

  resources :feedbacks, except: [:show] do
    member do
       get :delete
     
     end
  end
  devise_for :admins
  
 # devise_for :users

  root to: 'static_pages#home'

  get 'blogs/index'

 # uncomment this for page 404 //
 get "*path", to: redirect("/404.html")



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
