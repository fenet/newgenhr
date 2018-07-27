class StaticPagesController < ApplicationController
  def home
  	@vacancy = Vacancy.order("created_at DESC").limit(3)
  	@blog = Blog.order("created_at DESC").limit(3)
  	@contact = Contact.order("created_at DESC").limit(4)
  end
end
