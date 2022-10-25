class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
    @list = List.find(params[:id])
  end

  def create
    bookmark = Bookmark.new(
      comment: params[:comment],
      list_id: params[:list_id],
      movie_id: params[:movie_id]
    )
    if bookmark.save!
      redirect_to list_path(bookmark.list_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # def bookmark_params
  #   params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  # end
end
