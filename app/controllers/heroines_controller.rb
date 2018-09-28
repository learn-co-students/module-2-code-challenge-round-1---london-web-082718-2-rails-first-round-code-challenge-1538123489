class HeroinesController < ApplicationController

  before_action :set_powers, only: [:new]

  def index
    @heroines = if params[:power_name]
        Heroine.all.select {|h| h.power.name == params[:power_name]}
      else params[:super_name]
        Heroine.all
      end
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
      redirect_to heroine_path(@heroine)
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :power_name)
  end

  def set_powers
    @powers = Power.all.sort_by { |r| r.name }
  end

end
