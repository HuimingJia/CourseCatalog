class SearchController < ApplicationController
  def new
    name  = params[:search][:name]
    subject  = params[:search][:subject]

    @courses = Course.where(name: params[:search][:name])
    @state = Hash.new
    @courses.each do |course|
      if course.users.include?(current_user)
        @state[course.id] = true
      else
        @state[course.id] = false
      end
    end
      @subjects = Subject.all
  end
end
