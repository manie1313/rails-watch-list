class ListsController < ApplicationController
  def index
    @lists = List.all
    # returns an empty array ==> rails c do List.all
  end

  def show
    @list = List.find(params[:id])
    # id of different list
    # @view instance variable created so we can access it in the view
    @list.bookmarks =
  end

  def new
    @lists = List.new
  end

  def create
    raise
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new, status: :unprocessable_entity
      # reload the form, we want to re-render the page new
    end
  end

  # def destroy
  #   raise
  #   @list = List.find(params[:id])
  #   @list.delete
  #   redirect_to lists_show_path(@list)
  # end

  private

  def list_params
    # params.require(:list).permit(:name)
    # by default the info from the form are not allowed so we need to access them
    # from the params
  end
end

# has many means we can do this.this
# if you want to delete a mobie you re deleting a bookmark
