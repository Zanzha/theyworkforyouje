class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
load_and_authorize_resource
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
    @votes_grouped = @votes.group(:proposition_title).order("id DESC")
    @votes_grouped_pagination = @votes_grouped.paginate(:page => params[:page])
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
	@propositions = Proposition.all
  @politicians = Politician.all
	@mainid = Vote.find(params[:id]).voting_id.to_i
	@proposition = Proposition.where(p_id: @vote.p_id).take
    @shared_voteid = Vote.where(voting_id: @mainid)
    @shared_voteid_type = Vote.where(voting_id: @mainid).group_by(&:vote_type)
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:proposition_id, :type)
    end
end
