class GossipsController < ApplicationController
 
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]

  def index
    @gossip = Gossip.all
  end

  def show
  end

  def new
    @gossip = Gossip.new(user: User.first, title: "", content: "")
  end

  def create
    @gossip = Gossip.new(user: User.first, title: params[:title], content: params[:content])

    if @gossip.save
      redirect_to @gossip, flash: {success: "Ton Gossip a été créé avec succès !"}
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gossip.update(gossip_params)
      redirect_to @gossip, flash: {success: "Ton Gossip a été modifié avec succès !"}
    else
      render :edit
    end
  end

  def destroy
    @gossip.destroy
    redirect_to "/"
  end

  private

  def gossip_params
    params.require(:gossip).permit(:user, :title, :content)
  end

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end
end
