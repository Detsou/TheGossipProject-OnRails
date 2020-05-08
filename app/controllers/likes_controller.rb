class LikesController < ApplicationController

  before_action :find_like, only: [:destroy]

  def new
    @like = Like.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @like = Like.new(gossip_id: params[:gossip_id], user: current_user)
  
    if @like.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def destroy
    @like.destroy
    redirect_to request.referrer
  end

  private

  def find_like
    @gossip = Gossip.find(params[:gossip_id])
    @like = @gossip.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, gossip_id: params[:gossip_id]).exists?
  end

end
