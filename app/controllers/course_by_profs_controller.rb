class CourseByProfsController < ApplicationController
  before_action :set_course_by_prof, only: [:show, :edit, :update, :destroy]

  # GET /course_by_profs
  # GET /course_by_profs.json
  def index
    @course_by_profs = CourseByProf.all
  end

  # GET /course_by_profs/1
  # GET /course_by_profs/1.json
  def show
  end

  # GET /course_by_profs/new
  def new
    @course_by_prof = CourseByProf.new
  end

  # GET /course_by_profs/1/edit
  def edit
  end

  # POST /course_by_profs
  # POST /course_by_profs.json
  def create
    @course_by_prof = CourseByProf.new(course_by_prof_params)

    respond_to do |format|
      if @course_by_prof.save
        format.html { redirect_to @course_by_prof, notice: 'Course by prof was successfully created.' }
        format.json { render :show, status: :created, location: @course_by_prof }
      else
        format.html { render :new }
        format.json { render json: @course_by_prof.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_by_profs/1
  # PATCH/PUT /course_by_profs/1.json
  def update
    respond_to do |format|
      if @course_by_prof.update(course_by_prof_params)
        format.html { redirect_to @course_by_prof, notice: 'Course by prof was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_by_prof }
      else
        format.html { render :edit }
        format.json { render json: @course_by_prof.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_by_profs/1
  # DELETE /course_by_profs/1.json
  def destroy
    @course_by_prof.destroy
    respond_to do |format|
      format.html { redirect_to course_by_profs_url, notice: 'Course by prof was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_by_prof
      @course_by_prof = CourseByProf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_by_prof_params
      params.require(:course_by_prof).permit(:course_id)
    end
end
