class PagesController < ApplicationController
  def landing
    @advantages = Advantage.all
    @contacts = Contact.order("region DESC")
    @main_contact = @contacts.first
    @social_links = SocialLink.all
  end
end
