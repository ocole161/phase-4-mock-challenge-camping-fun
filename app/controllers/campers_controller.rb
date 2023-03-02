class CampersController < ApplicationController

  # GET /campers
  def index
    render json: Camper.all
  end

  # GET /campers/1
  def show
    render json: get_camper, serializer: ShowcampersSerializer
  end

  # POST /campers
  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  # DELETE /campers/1
  def destroy
    camper = get_camper
    camper.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_camper
      Camper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def camper_params
      params.permit(:name, :age)
    end
end
