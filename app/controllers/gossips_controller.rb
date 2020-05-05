class GossipsController < ApplicationController
  def index
  end

  def create
    @gossip = Gossip.new(user: User.first, title: params[:title], content: params[:content])

    if @gossip.save
      redirect_to "/"
    else
      render :new
    end
  end

  def new
    @gossip = Gossip.new(user: User.last, title: "", content: "")
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
