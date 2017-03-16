class SearchController < ApplicationController
  def new
    name  = params[:search][:name]
    subject  = params[:search][:subject]

    @courses = Course.where(name: params[:search][:name])
    @subjects = Subject.all
  end
end
