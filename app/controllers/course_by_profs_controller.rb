class CourseByProfsController < ApplicationController
  before_action :set_course_by_prof, only: [:show, :edit, :update, :destroy]

  # GET /course_by_profs
  # GET /course_by_profs.json
  def index
    course_by_prof_ids = []
    if params[:season].present?
      case params[:season]
      when "ALL"
        course_by_prof_ids = Section.all.pluck(:course_by_prof_id)
      when "THIS-YEAR"
        course_by_prof_ids = Section.where(quarter: "AUT", year: 2018).or(Section.where(quarter: "WIN", year: 2019)).or(Section.where(quarter: "SPR", year: 2019)).or(Section.where(quarter: "SUM", year: 2019)).pluck(:course_by_prof_id)
      else
        course_by_prof_ids = Section.where(quarter: params[:season].split(" ")[0], year: params[:season].split(" ")[1]).pluck(:course_by_prof_id)
      end
    end
    if course_by_prof_ids.present?
      @course_by_profs = CourseByProf.where(id: course_by_prof_ids)
    else
      @course_by_profs = CourseByProf.all
    end
    if params[:sort_field_1].present?
      if course_by_prof_ids.present?
        @course_by_profs = CourseByProf.where(id: course_by_prof_ids).where("#{params[:sort_field_1]} IS NOT NULL").order("#{params[:sort_field_1]} #{params[:sort_field_1_dir].upcase}")
      else
        @course_by_profs = CourseByProf.where("#{params[:sort_field_1]} IS NOT NULL").order("#{params[:sort_field_1]} #{params[:sort_field_1_dir].upcase}")
      end
    end

    # elsif params[:sort_field_1].present? && params[:sort_field_2].present?
    #   @course_by_profs = CourseByProf.where("#{params[:sort_field_1]} IS NOT NULL AND #{params[:sort_field_2]} IS NOT NULL").order("#{params[:sort_field_1]} #{params[:sort_field_1_dir].upcase}, #{params[:sort_field_2]} #{params[:sort_field_2_dir].upcase}")
    # elsif params[:sort_field_1].present? && params[:sort_field_2].present? && params[:sort_field_3].present?
    #   @course_by_profs = CourseByProf.where("#{params[:sort_field_1]} IS NOT NULL AND #{params[:sort_field_2]} IS NOT NULL AND #{params[:sort_field_3]} IS NOT NULL").order("#{params[:sort_field_1]} #{params[:sort_field_1_dir].upcase}, #{params[:sort_field_2]} #{params[:sort_field_2_dir].upcase}, #{params[:sort_field_3]} #{params[:sort_field_3_dir].upcase}")
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
