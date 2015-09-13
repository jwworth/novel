class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.order(created_at: :desc)
  end

  def new
    @chapter = Chapter.new
  end

  def show
    @chapter = Chapter.find(params[:id])
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.save
  end

  private

  def chapter_params
    params.require(:chapter).permit(:title, :body)
  end
end
