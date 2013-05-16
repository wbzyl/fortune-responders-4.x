class FortunesController < ApplicationController
  before_action :set_fortune, only: [:show, :edit, :update, :destroy]

  def index
    @fortunes = Fortune.text_search(params[:query])
      .order('created_at DESC')
      .page(params[:page])
      .per_page(4)
    respond_with(@fortunes)
  end

  def show
    @comment = Comment.new
    respond_with(@fortune)
  end

  def new
    @fortune = Fortune.new
    respond_with(@fortune)
  end

  def edit
  end

  def create
    @fortune = Fortune.new(fortune_params)
    @fortune.save
    respond_with(@fortune)
  end

  def update
    @fortune.update(fortune_params)
    respond_with(@fortune)
  end

  def destroy
    @fortune.destroy
    respond_with(@fortune)
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_fortune
    @fortune = Fortune.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fortune_params
    params.require(:fortune).permit(:quotation, :source)
  end

end
