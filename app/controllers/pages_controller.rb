class PagesController < ApplicationController
  def landing
    @settings = Setting.all.first

    @products_all = Product.all
    @products = @products_all.where(product_type: "Товар")
    @services = @products_all - @products

    @groups = Group.all
    @groups_left = @groups.first(2)
    @groups_right = @groups - @groups_left

    @activities = Activity.all
    @reviews = Review.all
    @advantages = Advantage.all
    @bonuses = Bonuse.all

    @contacts = Contact.order("region DESC")
    @social_links = SocialLink.all

    @message = Message.new
  end
end
