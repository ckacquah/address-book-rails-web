class CityTownsController < ApplicationController
  before_action :set_city_town, only: %i[ show edit update destroy ]

  # GET /city_towns or /city_towns.json
  def index
    @city_towns = CityTown.all
  end

  # GET /city_towns/1 or /city_towns/1.json
  def show
  end

  # GET /city_towns/new
  def new
    @city_town = CityTown.new
  end

  # GET /city_towns/1/edit
  def edit
  end

  def get_cities
  region_code = params[:region_code]
  @region = Region.where(assigned_code: region_code, active_status: true, del_status: false).last
    if @region
      code = region.assigned_code
      @cities = CityTown.where(region_code: code).map{|i| [i.name i.assigned]}
    end
  end

  # POST /city_towns or /city_towns.json
  def create
    @city_town = CityTown.new(city_town_params)

    respond_to do |format|
      if @city_town.save
        format.html { redirect_to city_town_url(@city_town), notice: "City town was successfully created." }
        format.json { render :show, status: :created, location: @city_town }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city_town.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_towns/1 or /city_towns/1.json
  def update
    respond_to do |format|
      if @city_town.update(city_town_params)
        format.html { redirect_to city_town_url(@city_town), notice: "City town was successfully updated." }
        format.json { render :show, status: :ok, location: @city_town }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city_town.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_towns/1 or /city_towns/1.json
  def destroy
    @city_town.destroy

    respond_to do |format|
      format.html { redirect_to city_towns_url, notice: "City town was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_town
      @city_town = CityTown.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_town_params
      params.require(:city_town).permit(:assigned_code, :name, :description, :del_status, :active_status, :region_code)
    end
end
