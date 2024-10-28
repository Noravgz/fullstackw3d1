class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.first # Associe un utilisateur par défaut pour l'instant

    if @gossip.save
      redirect_to gossip_path(@gossip), notice: 'Potin créé avec succès !'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
