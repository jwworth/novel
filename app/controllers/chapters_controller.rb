class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.order(created_at: :desc)
      .page(params[:page])
      .per(20)
  end

  def show
    @chapter = Chapter.find(params[:id])
  end
end
