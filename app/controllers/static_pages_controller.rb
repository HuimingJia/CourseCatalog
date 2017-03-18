class StaticPagesController < ApplicationController
  def about
  end

  def contact
  end

  def help
  end

  def home
  end

  def error
    status_code = params[:code] || 500
    render 'error'
  end
end
