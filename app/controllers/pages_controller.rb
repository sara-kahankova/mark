class PagesController < ApplicationController
  def home
    @rentals = Rental.all
  end

  def about

  end

end
