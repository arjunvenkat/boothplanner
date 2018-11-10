class TaughtBiesController < ApplicationController
  before_action :set_taught_by, only: [:show, :edit, :update, :destroy]

  # GET /taught_bies
  # GET /taught_bies.json
  def index
    @taught_bies = TaughtBy.all
  end

  # GET /taught_bies/1
  # GET /taught_bies/1.json
  def show
  end

  # GET /taught_bies/new
  def new
    @taught_by = TaughtBy.new
  end

  # GET /taught_bies/1/edit
  def edit
  end

  # POST /taught_bies
  # POST /taught_bies.json
  def create
    @taught_by = TaughtBy.new(taught_by_params)

    respond_to do |format|
      if @taught_by.save
        format.html { redirect_to @taught_by, notice: 'Taught by was successfully created.' }
        format.json { render :show, status: :created, location: @taught_by }
      else
        format.html { render :new }
        format.json { render json: @taught_by.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taught_bies/1
  # PATCH/PUT /taught_bies/1.json
  def update
    respond_to do |format|
      if @taught_by.update(taught_by_params)
        format.html { redirect_to @taught_by, notice: 'Taught by was successfully updated.' }
        format.json { render :show, status: :ok, location: @taught_by }
      else
        format.html { render :edit }
        format.json { render json: @taught_by.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taught_bies/1
  # DELETE /taught_bies/1.json
  def destroy
    @taught_by.destroy
    respond_to do |format|
      format.html { redirect_to taught_bies_url, notice: 'Taught by was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taught_by
      @taught_by = TaughtBy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def taught_by_params
      params.require(:taught_by).permit(:course_id, :instructor_id)
    end
end
