class RegionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_region, only: %i[show edit update destroy]



  # GET /regions or /regions.json

  def index

    @regions = Region.active_and_not_deleted

  end



  # GET /regions/1 or /regions/1.json

  def show
    @city_towns = @region.city_towns
  end



  # GET /regions/new

  def new

    @region = Region.new

  end



  # GET /regions/1/edit

  def edit; end



  # POST /regions or /regions.json

  def create

    @region = Region.new(region_params)



    respond_to do |format|

      if @region.save
        flash[:success] = "Region was successfully created."
        format.html { redirect_to region_url(@region) }

        format.json { render :show, status: :created, location: @region }

      else
        flash[:error] = "Region update failed."
        format.html { render :new, status: :unprocessable_entity }

        format.json { render json: @region.errors, status: :unprocessable_entity }

      end

    end

  end



  # PATCH/PUT /regions/1 or /regions/1.json

  def update

    respond_to do |format|

      if @region.safe_update(region_params)
        flash[:success] = "Region was successfully updated."
        format.html { redirect_to region_url(@region) }

        format.json { render :show, status: :ok, location: @region }

      else
        flash[:error] = "Region updated failed."
        format.html { render :edit, status: :unprocessable_entity }

        format.json { render json: @region.errors, status: :unprocessable_entity }

      end

    end

  end



  # DELETE /regions/1 or /regions/1.json

  def destroy

    @region.safe_delete



    respond_to do |format|

      flash[:success] = "Region was successfully destroyed."

      format.html { redirect_to regions_url }

      format.json { head :no_content }

    end

  end



  private



  # Use callbacks to share common setup or constraints between actions.

  def set_region

    @region = Region.find_safely(params[:id])

  end



  # Only allow a list of trusted parameters through.

  def region_params

    params.require(:region).permit(:name, :description)

  end

end

