class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show, :edit, :update, :destroy, :undelete]
## load_and_authorize_resource
  # GET /politicians
  # GET /politicians.json

  def index
    @politicians = Politician.all
    @politicians_grouped = @politicians.group_by(&:title)
  end

def manage
  @politicians = Politician.all
end
  # GET /politicians/1
  # GET /politicians/1.json
  def show
	@votes_pagination = @politician.votes.paginate(:page => params[:page])
  end
  # GET /politicians/new
  def new
    @politician = Politician.new
  end

  # GET /politicians/1/edit
  def edit
  end

  # POST /politicians
  # POST /politicians.json
  def create
    @politician = Politician.new(politician_params)

    respond_to do |format|
      if @politician.save
        format.html { redirect_to @politician, notice: 'Politician was successfully created.' }
        format.json { render :show, status: :created, location: @politician }
      else
        format.html { render :new }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /politicians/1
  # PATCH/PUT /politicians/1.json
  def update
    respond_to do |format|
      if @politician.update(politician_params)
        format.html { redirect_to @politician, notice: 'Politician was successfully updated.' }
        format.json { render :show, status: :ok, location: @politician }
      else
        format.html { render :edit }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /politicians/1
  # DELETE /politicians/1.json
  def destroy
      @politician.destroy
      respond_to do |format|
        format.html { redirect_to politicians_url, notice: 'Politician was successfully Archived.' }
        format.json { head :no_content }
      end
    end

    def restore
      @politician = Politician.with_deleted.find(params[:id])
      @politician.restore
        respond_to do |format|
        format.html { redirect_to manage_politicians_path, notice: 'Politician was successfully restored.' }
        format.json { head :no_content }
      end
    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician
      if !current_user.blank? && current_user.role.name == "Admin"
        @politician = Politician.with_deleted.find(params[:id])
      else
        @politician = Politician.without_deleted.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def politician_params
    params.fetch(:politician, {})
    params.permit(:deleted_at)
    end
end
