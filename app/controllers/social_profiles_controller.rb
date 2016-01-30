class SocialProfilesController < ApplicationController
	before_action :set_social_profile, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def edit
	end

	def create
    @social_profile = SocialProfile.new(social_profile_params)

    respond_to do |format|
      if @social_profile.save
        format.html { redirect_to @current_user, notice: 'Social profile was successfully created.' }
        format.json { render :show, status: :created, location: @current_user }
      else
        format.html { render :new }
        format.json { render json: @social_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_profiles/1
  # PATCH/PUT /social_profiles/1.json
  def update
    respond_to do |format|
      if @full_profile.update(social_profile_params)
        format.html { redirect_to @current_user, notice: 'Social profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_user }
      else
        format.html { render :edit }
        format.json { render json: @full_profile.errors, status: :unprocessable_entity }
      end
    end
  end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_profile
      @full_profile = SocialProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_profile_params
      params[:social_profile]
    end
end