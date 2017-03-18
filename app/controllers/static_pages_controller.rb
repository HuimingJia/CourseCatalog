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
    flash.alert = "Status #{status_code}"
    render 'error', status: status_code
  end
end
