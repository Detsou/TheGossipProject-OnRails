class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comment = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(gossip_id: params[:gossip_id], content: params[:content],  user: User.all.sample)
  
    if @comment.save
      flash[:success] = "Ton commentaire a été ajouté avec succès !"
      redirect_to @gossip
    else
      flash[:danger] = "Ton commentaire ne respecte pas le format adapté."
      redirect_to "/"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :gossip, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end