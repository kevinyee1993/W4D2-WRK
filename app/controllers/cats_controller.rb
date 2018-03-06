class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end


  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      redirect_to cat_url
    end
  end


  def new
    render :new
  end


  def create
    @cat = Cat.new(cat_params)
    # @cat.save!
    if @cat.save
      redirect_to cat_url(@cat)
    else
      redirect_to new_cat_url
    end
  end


  def edit
    @cat = Cat.find_by(id: params[:id])
    unless @cat
      redirect_to cats_url
    else
      render :edit
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])

    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      redirect_to edit_cat_url(@cat)
    end

  end


  def cat_params
    params.require(:cat).permit(:name, :color, :sex,:description, :birth_date)

  end
end
