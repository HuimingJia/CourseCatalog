class SearchController < ApplicationController
  def new
    @name = params[:search][:name].strip
    @subject  = params[:search][:subject] || 'All'

    @courses = Array.new
    @temp = Course.where("name LIKE ?", "%#{@name}%")
    if @subject == 'All'
      @temp.each do |course|
        @courses.push(course)
      end
    else
      @temp.each do |course|
        if course.subjects.include?(Subject.where(name: @subject).first)
          @courses.push(course)
        end
      end
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
