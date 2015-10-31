class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.order(created_at: :desc)
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      redirect_to root_path
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :body)
  end
end
