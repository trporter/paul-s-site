class CollectionsController < ApplicationController

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new collection_params
    if @collection.save
      redirect_to collection_path(@collection)
    else
      flash[:alert] = "Collection not Created"
      render :new
    end
  end

  def show
    @collection = Collection.find params[:id]
    respond_to do |format|
      format.html
      format.json {render json: {collection: @collection}}
    end
  end

  def index
    @collection = Collection.order("name ASC")
  end

  def edit
  end

  def update
    if @collection.update collection_params
      redirect_to collection_path(@collection), notice: "Collection Changed"
    else
      render :edit
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_path, notice: "Collection Deleted"
  end

  private

  def collection_params
    params.require(:collection).permit(:title, :year, :description)
  end

  def find_collection
    @collection = Collection.find params[:id]
  end
end
