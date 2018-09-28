class HeroinesController < ApplicationController
  before_action :set_powers, only: [:new, :edit]
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power)
  end

  def set_powers
    @powers = Power.all.sort_by { |r| r.name }
  end

end
