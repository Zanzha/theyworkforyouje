class PropositionsController < ApplicationController
  before_action :set_proposition, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /propositions
  # GET /propositions.json
  def index
    @propositions = Proposition.all.order("id DESC").paginate(:page => params[:page])
    @votes = Vote.all
  end

  # GET /propositions/1
  # GET /propositions/1.json
  def show
    @votes = Vote.all
    @propositions = Proposition.all
    @politicians = Politician.all
  	@mainid = Vote.find(params[:id]).voting_id.to_i
  	@proposition = Proposition.where(p_id: @vote.p_id).take
      @shared_voteid = Vote.where(voting_id: @mainid)
      @shared_voteid_type = Vote.where(voting_id: @mainid).group_by(&:vote_type)
  end

  # GET /propositions/new
  def new
    @proposition = Proposition.new
  end

  # GET /propositions/1/edit
  def edit
  end

  # POST /propositions
  # POST /propositions.json
  def create
    @proposition = Proposition.new(proposition_params)

    respond_to do |format|
      if @proposition.save
        format.html { redirect_to @proposition, notice: 'Proposition was successfully created.' }
        format.json { render :show, status: :created, location: @proposition }
      else
        format.html { render :new }
        format.json { render json: @proposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /propositions/1
  # PATCH/PUT /propositions/1.json
  def update
    respond_to do |format|
      if @proposition.update(proposition_params)
        format.html { redirect_to @proposition, notice: 'Proposition was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposition }
      else
        format.html { render :edit }
        format.json { render json: @proposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /propositions/1
  # DELETE /propositions/1.json
  def destroy
    @proposition.destroy
    respond_to do |format|
      format.html { redirect_to propositions_url, notice: 'Proposition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposition
      @proposition = Proposition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposition_params
      params.require(:proposition).permit(:politician_id, :title, :proposition_date, :vote_date, :reference)
    end
end
