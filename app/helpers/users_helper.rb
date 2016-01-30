module UsersHelper

	# returns  the gravatar for the given user
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=400"
		image_tag(gravatar_url, alt: user.name, class: "profile-avatar-img img-responsive thumbnail")
	end

end
