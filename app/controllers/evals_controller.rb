class EvalsController < ApplicationController
  before_action :set_eval, only: [:show, :edit, :update, :destroy]

  # GET /evals
  # GET /evals.json
  def index
    @evals = Eval.all
  end

  # GET /evals/1
  # GET /evals/1.json
  def show
  end

  # GET /evals/new
  def new
    @eval = Eval.new
  end

  # GET /evals/1/edit
  def edit
  end

  # POST /evals
  # POST /evals.json
  def create
    @eval = Eval.new(eval_params)

    respond_to do |format|
      if @eval.save
        format.html { redirect_to @eval, notice: 'Eval was successfully created.' }
        format.json { render :show, status: :created, location: @eval }
      else
        format.html { render :new }
        format.json { render json: @eval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evals/1
  # PATCH/PUT /evals/1.json
  def update
    respond_to do |format|
      if @eval.update(eval_params)
        format.html { redirect_to @eval, notice: 'Eval was successfully updated.' }
        format.json { render :show, status: :ok, location: @eval }
      else
        format.html { render :edit }
        format.json { render json: @eval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evals/1
  # DELETE /evals/1.json
  def destroy
    @eval.destroy
    respond_to do |format|
      format.html { redirect_to evals_url, notice: 'Eval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eval
      @eval = Eval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eval_params
      params.require(:eval).permit(:taught_by_id, :section, :quarter, :year, :enrl, :num_responses, :percent_responded, :hours_per_week, :clear, :interesting, :useful, :overall, :reccommend)
    end
end
