class UsersController < ApplicationController

  before_action :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]

  # GET /users
  def index
  	@users = User.paginate(page: params[:page], :per_page => 6)
  end

  #GET /users/1
  def show
    @user = User.find(params[:id])
  end

  def edit
    @full_profile = @user.full_profile
  end

  def update
  	respond_to do |format|
      if UserService.update(@user, user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
  			format.html {redirect_to @user, noce: 'User was successfully updated'}
  			format.json {render :show, status: :ok, location: @user}
  		else
  			format.html {render :edit}
  			format.json {render json: @user.errors, status: :unprocessable_entity}
  		end
  	end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private

  	def set_user
  		@user = User.find(params[:id])
  	end

  	def user_params
      accessible = [ :email, :username, :first_name, :last_name, full_profile: [:proposal_comments, :associations, :interests, :birthdate ] ]
      params.require(:user).permit(accessible)
  	end

end
