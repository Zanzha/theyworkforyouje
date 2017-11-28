class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /notices
  # GET /notices.json
  def index
    @users = User.all
  end



  # GET /notices/1
  # GET /notices/1.json
  def show
  end

  # GET /notices/new
  def new
    @user = User.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  # POST /notices.json
  def create
    @user = User.new(user_params)
    @user.role_id = 1
    @user.created_by = current_user.id
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, user: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notices/1
  # PATCH/PUT /notices/1.json
  def update
    respond_to do |format|
      if params[:user][:password].blank?
  params[:user].delete(:password)
  params[:user].delete(:password_confirmation)
end
      if @user.update(user_params)
        format.html { redirect_to @user, user: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notices/1
  # DELETE /notices/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, user: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user ).permit(:user_id, :username, :email, :role_id,:password, :password_confirmation, :created_by)
    end
end
