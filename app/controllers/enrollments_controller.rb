class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(course_id: params[:enrollment][:course_id], user_id:params[:enrollment][:user_id] )
    if @enrollment.save
      render 'show', locals: { message: 'Enrollment was successfully created.', status: 'T'}
    else
      render 'show', locals: { message: 'omething Wrong T_T!.', status: 'F'}
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    if Enrollment.where(course_id: params[:enrollment][:course_id].to_i, user_id:params[:enrollment][:user_id].to_i).destroy_all
      render 'show', locals: { message: 'Enrollment was successfully destroyed.', status: 'T'}
    else
      render 'show', locals: { message: 'omething Wrong T_T!.', status: 'F'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      # @enrollment = Enrollment.new(course_id: params[:enrollment][:course_id], user_id:params[:enrollment][:user_id] )
      @enrollment = Enrollment.new(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:user_id, :course_id)
    end
end
