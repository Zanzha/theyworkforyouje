class TermsController < ApplicationController


  # GET /terms
  # GET /terms.json
  def index
    @parishes = Parish.all
    first_term = Term.order(:begin_date).select('YEAR(`begin_date`) AS begin_date').first
    end_term = Term.order(end_date: :desc).select('YEAR(`end_date`) AS end_date').first
    @first_year = first_term['begin_date'].to_i
    @last_year = end_term['end_date'].to_i

    terms = Term.where("`parish_id` = ? AND YEAR(`begin_date`) <= ? AND YEAR(`end_date`) >= ? ", params[:parish_id], params[:year], params[:year])

  end

  # GET /terms/1
  # GET /terms/1.json
  def show
    @parishes = Parish.all
    @terms = Term.where("`parish_id` = ? AND YEAR(`begin_date`) <= ? AND YEAR(`end_date`) >= ? ", params[:parish_id], params[:year], params[:year])
  end

  # GET /terms/new
  def new
    @terms = Term.new
  end

  # GET /terms/1/edit
  def edit
  end

  # POST /terms
  # POST /terms.json
  def create
    @term = Term.new(term_params)

    respond_to do |format|
      if @term.save
        format.html { redirect_to @term, notice: 'Term was successfully created.' }
        format.json { render :show, status: :created, location: @term }
      else
        format.html { render :new }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /terms/1
  # PATCH/PUT /terms/1.json
  def update
    respond_to do |format|
      if @term.update(term_params)
        format.html { redirect_to @term, notice: 'Term was successfully updated.' }
        format.json { render :show, status: :ok, location: @term }
      else
        format.html { render :edit }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /terms/1
  # DELETE /terms/1.json
  def destroy
    @term.destroy
    respond_to do |format|
      format.html { redirect_to terms_url, notice: 'Term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term
      @term = Term.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def term_params
      params.require(:term).permit(:parishid, :title, :first_name, :middle_name, :last_name, :gender, :Date_of_birth, :website_url, :facebook_url)
    end
end
