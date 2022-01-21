class PagesController < ApplicationController
  def home
    @packages = Package.all
    @posts = Post.all
    @rentals = Rental.all
    @reviews = Review.all
  end

end
