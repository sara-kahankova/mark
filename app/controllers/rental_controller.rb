class RentalController < ApplicationController
  before_create :find_rental, only: %i(show edit update)
  def show; end

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental.new(rental_params)
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  def edit; end

  def update
    @rental.update(rental_params)
  end

  private

  def find_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:title, :address, :description, :price, :size, :city)
  end
end
