class SearchController < ApplicationController
  def new
    @course_name = params[:search][:name].strip
    @subject_name  = params[:search][:subject]
    if @subject_name == "All"
      @subject_name = ""
    end
    @courses = Course.joins(:subjects).where("courses.name LIKE ?", "%#{@course_name}%").where("subjects.name Like ?", "%#{@subject_name}%").group(:course_id)
    @states = Hash.new
    @courses.each do |course|
      if course.users.include?(current_user)
        @states[course.id] = true
      else
        @states[course.id] = false
      end
    end
    @subjects = Array.new
    @subjects.push('All')
    Subject.all.each do |subject|
      @subjects.push(subject.name)
    end
    render :partial => 'form'
  end

  def page
    @courses = Course.all.paginate(page:params[:page],per_page:10)
    @states = Hash.new
    @courses.each do |course|
      if course.users.include?(current_user)
        @states[course.id] = true
      else
        @states[course.id] = false
      end
    end
    @subjects = Array.new
    @subjects.push('All')
    Subject.all.each do |subject|
      @subjects.push(subject.name)
    end
    render 'new'
  end

end
