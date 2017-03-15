module UsersHelper
  def gravatar_for(user, options = { size: 180 })
    gravatar_id = Digest::MD5::hexdigest(user.account.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.account, class: "gravatar img-rounded img-responsive")
  end
end
