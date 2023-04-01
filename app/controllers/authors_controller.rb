class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    @author = Author.new(author_params)
    if author.save
      redirect_to author_path(author)
    else
      render :new, flash: { error: author.errors.full_messages.join(", ") }
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :email)
  end
end
