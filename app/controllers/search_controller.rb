class SearchController < ApplicationController
  def new
    @course_name = params[:search][:name].strip
    @subject_name  = params[:search][:subject]

    if @subject_name == "All"
      @subject_name = ""
    end
    @courses = Course.joins(:subjects).where("courses.name LIKE ?", "%#{@course_name}%").where("subjects.name Like ?", "%#{@subject_name}%").group(:course_id).paginate(page:params[:page],per_page:10)

    @state = Hash.new
    puts @courses.count
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

  def new_ajax
    @results = User.find(:all,:conditions => [ "first_name LIKE ?","%#{params[:user][:name]}%"])
    render :layout=>false
  end
end
