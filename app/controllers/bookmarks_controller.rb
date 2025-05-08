class BookmarksController < ApplicationController

  def new
    raise
    @list = List.find(params[:list_id])
    # @list.name for later in the new bookmarks
    @bookmark = Bookmark.new
  end

  def show 
  def create
    raise
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
      # its dynamic so we add an instance variable
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_show_path(@bookmark.list)
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
    # we do not need list.id bcz it s already in the url it s nested
    # we do not nee d it :list_id
  end
end
