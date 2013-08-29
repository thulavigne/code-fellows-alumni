module LinksHelper

  def url_types
    return [
      (t "links.home_page"),
      (t "links.blog"),
      (t "links.professional_networking"),
      (t "links.social_networking"),
      (t "links.code_repository"),
      (t "links.other")
    ]
  end

end
