class SearchController < ApplicationController
  def new
    @name  = params[:search][:name]
    @subject  = params[:search][:subject] || 'All'

    if @subject == 'All'
      @courses = Course.where(name: params[:search][:name])
    else
      @courses = Course.where(name: params[:search][:name])
    end

    @courses.each do |course|
      puts course.subjects.all.name
    end
    @state = Hash.new
    @courses.each do |course|
      if course.users.include?(current_user)
        @state[course.id] = true
      else
        @state[course.id] = false
      end
    end
    @subjects = Array.new
    @subjects.push('All')
    Subject.all.each do |subject|
      @subjects.push(subject.name)
    end
  end

  def page
    @subjects = Array.new
    @subjects.push('All')
    Subject.all.each do |subject|
      @subjects.push(subject.name)
    end
    @subject  = 'All'
    render 'page'
  end
end
