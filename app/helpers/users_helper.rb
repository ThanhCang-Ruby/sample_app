module UsersHelper
  def gravatar_for user, size: Settings.userhelper.gravatar_for.size
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def admin? user
    if current_user.admin? && !current_user?(user)
      link_to "delete", user, method: :delete,
        data: {confirm: t("_user.confirm")}
    end
  end
end
