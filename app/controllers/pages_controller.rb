require 'byebug'

class PagesController < ApplicationController
  def index
  end

  def show
    slug_param = params[:slug]
    @page = Page.find_by(slug: slug_param, :published => true)

    if @page.nil?
      redirect_to action: "not_found"
    end
  end

  def not_found
    head 404
  end
end
