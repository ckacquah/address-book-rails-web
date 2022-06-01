class SuburbsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_suburb, only: %i[show edit update destroy]



  # GET /suburbs or /suburbs.json

  def index

    puts '##########################################'

    puts '##########################################'

    puts params['filter-by-region']

    puts '##########################################'

    puts '##########################################'

    @suburbs = Suburb.active_and_not_deleted

  end



  # GET /suburbs/1 or /suburbs/1.json

  def show; end



  # GET /suburbs/new

  def new

    @suburb = Suburb.new

  end



  # GET /suburbs/1/edit

  def edit; end



  # POST /suburbs or /suburbs.json

  def create

    @suburb = Suburb.new(suburb_params)



    respond_to do |format|

      if @suburb.save

        flash[:success] = 'Suburb was successfully created.'

        format.html { redirect_to suburb_url(@suburb) }

        format.json { render :show, status: :created, location: @suburb }

      else

        flash[:error] = 'Suburb creation failed.'

        format.html { render :new, status: :unprocessable_entity }

        format.json { render json: @suburb.errors, status: :unprocessable_entity }

      end

    end

  end



  # PATCH/PUT /suburbs/1 or /suburbs/1.json

  def update

    respond_to do |format|

      if @suburb.safe_update(suburb_params)

        flash[:success] = 'Suburb was successfully updated.'

        format.html { redirect_to suburb_url(@suburb) }

        format.json { render :show, status: :ok, location: @suburb }

      else

        flash[:error] = 'Suburb update failed.'

        format.html { render :edit, status: :unprocessable_entity }

        format.json { render json: @suburb.errors, status: :unprocessable_entity }

      end

    end

  end



  # DELETE /suburbs/1 or /suburbs/1.json

  def destroy

    @suburb.safe_delete



    respond_to do |format|

      flash[:success] = 'Suburb was successfully destroyed.'

      format.html { redirect_to suburbs_url }

      format.json { head :no_content }

    end

  end



  private



  # Use callbacks to share common setup or constraints between actions.

  def set_suburb

    @suburb = Suburb.find_safely(params[:id])

  end



  # Only allow a list of trusted parameters through.

  def suburb_params

    params.require(:suburb).permit(:name, :description, :city_town_code)

  end

end

