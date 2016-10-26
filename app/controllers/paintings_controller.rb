class PaintingsController < ApplicationController

  def new
    @painting = Painting.new
  end

  def create
    @painting.Painting.new painting_params
    if @painting.save
      redirect_to painting_path(@painting)
    else
      flash[:alert] = "Painting not added"
      render :new
    end
  end

  def show
    @painting = Painting.find params[:id]
    respond_to do |format|
      format.html
      format.json {render json: {painting: @painting}}
    end
  end

  def index
    @paintings = Paintings.order("name ASC")
  end

  def edit
  end

  def update
    if @painting.update painting_params
      redirect_to painting_path(@painting), notice: "Painting Changed"
    else
      render :edit
    end
  end

  def destroy
    @painting.destroy
    redirect_to paintings_path, notice: "Painting Deleted"
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :year, :description, :dimentions)
  end

  def find_painting
    @painting = Painting.find params[:id]
  end
end
