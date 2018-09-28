class HeroinesController < ApplicationController

  before_action :get_powers, only: [:new, :create, :index]

  def index
    if params[:q]
      @heroines = Heroine.select { |heroine| heroine.power_name == params[:q] }
    else
      @heroines = Heroine.all
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def get_powers
    @powers = Power.all
  end

end
