class ContactsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_contact, only: %i[show edit update destroy]

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.active_and_not_deleted.has_name_like(params[:search]).order(:created_at)
    @pagy, @contacts = pagy(@contacts)
  end

  # GET /contacts/1 or /contacts/1.json
  def show; end
  


  # GET /contacts/new
  def new

    @contact = Contact.new

  end
  
  # GET /contacts/1/edit
  def edit; end

  def get_cities

    region_code = params[:region_code]
    @region = Region.active_and_not_deleted.where(assigned_code: region_code).last
    if @region
      code = @region.assigned_code
      @cities = CityTown.active_and_not_deleted.where(region_code: code).map { |i| [i.name, i.assigned_code] }
      @cities.insert(0, ['Select the City', ''])
      @cities
    end

  end

  def get_suburbs

    city_town_code = params[:city_town_code]
    @city_town = CityTown.active_and_not_deleted.where(assigned_code: city_town_code).last
    if @city_town
      code = @city_town.assigned_code
      @suburbs = Suburb.active_and_not_deleted.where(city_town_code: code).map { |i| [i.name, i.assigned_code] }
      @suburbs.insert(0, ['Select the Suburb', ''])
      @suburbs
    end

  end

  def get_localities

    suburb_code = params[:suburb_code]
    @suburb = Suburb.active_and_not_deleted.where(assigned_code: suburb_code).last
    if @suburb
      code = @suburb.assigned_code
      @localities = Locality.active_and_not_deleted.where(suburb_code: code).map { |i| [i.name, i.assigned_code] }
      @localities.insert(0, ['Select the Locality', ''])
      @localities
    end

  end

  # POST /contacts or /contacts.json
  def create

    @contact = Contact.new(contact_params)
    respond_to do |format|

      if @contact.save
        flash[:success] = 'Contact was successfully created.'
        format.html { redirect_to contact_url(@contact) }
        format.json { render :show, status: :created, location: @contact }
      else
        flash[:error] = 'Contact creation failed.'
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end

    end

  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update

    respond_to do |format|

      if @contact.safe_update(contact_params)
        flash[:success] = 'Contact was successfully updated.'
        format.html { redirect_to contact_url(@contact), notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        flash[:error] = 'Contact update failed.'
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end

    end

  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy

    @contact.safe_delete
    flash[:success] = 'Contact was successfully destroyed.'
    respond_to do |format|

      format.html { redirect_to contacts_url }
      format.json { head :no_content }

    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find_safely(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:last_name, :first_name, :phone, :name, :description, :locality_code, :region, :cities)
  end

end

