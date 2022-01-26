class PackagesController < ApplicationController
  before_action :find_package, only: %i(show edit update)

  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)
    if @package.save
      redirect_to packages_path
    else
      render :new
    end
  end


  def show; end

  def edit; end

  def update
    @package.update(package_params)
  end

  private

  def find_package
    @package = Package.find(params[:id])
  end

  def package_params
    params.require(:package).permit(:name, :price, :description)
  end


end
