class LocalitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_locality, only: %i[ show edit update destroy ]

  # GET /localities or /localities.json
  def index
    @localities = Locality.active_and_not_deleted
  end

  # GET /localities/1 or /localities/1.json
  def show
  end

  # GET /localities/new
  def new
    @locality = Locality.new
  end

  # GET /localities/1/edit
  def edit
  end

  # POST /localities or /localities.json
  def create
    @locality = Locality.new(locality_params)

    respond_to do |format|
      if @locality.save
        flash[:success] = "Locality was successfully created."
        format.html { redirect_to locality_url(@locality) }
        format.json { render :show, status: :created, location: @locality }
      else
        flash[:error] = "Locality creation failed."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /localities/1 or /localities/1.json
  def update
    respond_to do |format|
      if @locality.safe_update(locality_params)
        flash[:success] = "Locality was successfully updated."
        format.html { redirect_to locality_url(@locality) }
        format.json { render :show, status: :ok, location: @locality }
      else
        flash[:error] = "Locality update failed."
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localities/1 or /localities/1.json
  def destroy
    @locality.safe_delete

    respond_to do |format|
      flash[:success] = "Locality was successfully destroyed."
      format.html { redirect_to localities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locality
      @locality = Locality.find_safely(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def locality_params
      params.require(:locality).permit(:name, :description, :suburb_code)
    end
end
