class HeroinesController < ApplicationController


  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
    @powers = @heroine.powers
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @powers = Power.all
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end


  private

  # def set_heroine
  #   @heroine = Heroine.find(params[:id])
  # end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name)
  end

end
