class CityTownsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_city_town, only: %i[ show edit update destroy ]

  # GET /city_towns or /city_towns.json
  def index
    @city_towns = CityTown.active_and_not_deleted
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
      @cities = CityTown.where(region_code: code).map { |i| [i.name, i.assigned] }
    end
  end

  # POST /city_towns or /city_towns.json
  def create
    @city_town = CityTown.new(city_town_params)

    respond_to do |format|
      if @city_town.save
        flash[:success] = 'City was successfully created.'
        format.html { redirect_to city_town_url(@city_town) }
        format.json { render :show, status: :created, location: @city_town }
      else
        flash[:error] = 'City creation failed.'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city_town.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_towns/1 or /city_towns/1.json
  def update
    respond_to do |format|
      if @city_town.update(city_town_params)
        flash[:success] = 'City was successfully updated.'
        format.html { redirect_to city_town_url(@city_town) }
        format.json { render :show, status: :ok, location: @city_town }
      else
        flash[:error] = 'City update failed.'
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city_town.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_towns/1 or /city_towns/1.json
  def destroy
    @city_town.safe_delete

    respond_to do |format|
      flash[:success] = 'City was successfully destroyed.'
      format.html { redirect_to city_towns_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_city_town
    @city_town = CityTown.find_safely(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def city_town_params
    params.require(:city_town).permit(:name, :description, :region_code)
  end
end
