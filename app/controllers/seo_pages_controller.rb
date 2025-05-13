class SeoPagesController < ApplicationController
  def index
    @seo_pages = SeoPage.page(params[:page]).per(100)
  end
  
  def show
    @seo_page = SeoPage.find_by(slug: params[:id])
    @contact = Contact.new
  end
end