class PagesController < ApplicationController
  def landing
    @settings = Setting.all.first

    @products_all = Product.order("id ASC")
    @products = @products_all.where(product_type: "Товар")
    @services = @products_all - @products

    @groups = Group.order("id ASC")
    @groups_left = @groups.first(2)
    @groups_right = @groups - @groups_left

    @activities = Activity.order("id ASC")
    @reviews = Review.order("id ASC")
    @advantages = Advantage.order("id ASC")
    @bonuses = Bonuse.order("id ASC")

    @contacts = Contact.order("region DESC")
    @social_links = SocialLink.order("id ASC")

    @message = Message.new
  end
end
