class PagesController < ApplicationController
  def landing
    @social_links = SocialLink.all
    @contacts = Contact.order("region DESC")
    @main_contact = @contacts.first
  end
end
