module HomesHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(home)
    gravatar_id = Digest::MD5::hexdigest(home.name.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: home.name, class: "gravatar")
  end
end
