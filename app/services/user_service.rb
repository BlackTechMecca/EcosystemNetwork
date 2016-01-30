class UserService
  def self.update(user, params)
    params[:full_profile_attributes] = params.delete(:full_profile) || {}
    params[:social_profile_attributes] = params.delete(:social_profile) || {}
    user.update(params)
  end
end
