class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  def index
    @chapters = Chapter.all
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def chapter_params
      params.require(:chapter).permit(:title, :body)
    end
end
