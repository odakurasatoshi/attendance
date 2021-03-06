class Teachers::GenresController < ApplicationController
  before_action :authenticate_teacher!

  def index
    @genre = Genre.new
    @genres = Genre.all
 end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    if @genre.save
      redirect_to teachers_genres_path
    else
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "更新完了"
      redirect_to teachers_genres_path
    else
      render :edit
    end
  end

  # def destroy
  # @genre = Genre.find(params[:id])
  # @genre.destroy
  # redirect_to teachers_genres_path
  # end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
