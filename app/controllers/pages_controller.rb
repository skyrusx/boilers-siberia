class PagesController < ApplicationController
  def landing
    @social_links = SocialLink.all
  end
end
