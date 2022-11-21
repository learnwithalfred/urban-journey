class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show destroy]
  before_action :authenticate_user!, except: %i[index]

  # GET /entities or /entities.json
  def index
    @group = Group.find(params[:group_id])

    @entities = @group.entities.all.order(created_at: :desc)
  end

  # GET /entities/1 or /entities/1.json
  def show; end

  # GET /entities/new
  def new
    @group = Group.find(params[:group_id])
    @entity = @group.entities.new
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = @group.entities.create!(name: entity_params[:name], amount: entity_params[:amount],
                                      user_id: current_user.id, group_id: @group.id)

    respond_to do |format|
      format.html do
        if @entity.save
          redirect_to group_entities_path(@group.id), notice: 'You have successfully created a transaction.'
        else
          render :new, alert: 'Error: Transaction could not be saved'
        end
      end
    end
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
    @entity = Entity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
