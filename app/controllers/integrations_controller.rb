class IntegrationsController < ApplicationController
  before_filter :authenticate_user!

  # GET /integrations
  # GET /integrations.json
  def index
    @integrations = Integration.all
    @provider_types = ProviderType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @integrations }
    end
  end

  # GET /integrations/1
  # GET /integrations/1.json
  def show
    @integration = Integration.find(params[:id])
    @provider_types = ProviderType.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @integration }
    end
  end

  # GET /integrations/new
  # GET /integrations/new.json
  def new
    @integration = Integration.new
    @provider_types = ProviderType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @integration }
    end
  end

  # GET /integrations/1/edit
  def edit
    @integration = Integration.find(params[:id])
    @provider_types = ProviderType.all
  end

  # GET /integrations/1/edit
  def edit_mappings
    @integration = Integration.find(params[:id])
    mapping_service = Integrations::MappingService.new(@integration.provider_type,
                                                       @integration.url,
                                                       @integration.username,
                                                       @integration.password)
    @mappings = mapping_service.propose_mappings
  end

  # POST /integrations
  # POST /integrations.json
  def create
    @integration = Integration.new(params[:integration])

    respond_to do |format|
      if @integration.save
        format.html { redirect_to @integration, notice: 'Integration was successfully created.' }
        format.json { render json: @integration, status: :created, location: @integration }
      else
        format.html { render action: "new" }
        format.json { render json: @integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /integrations/1
  # PUT /integrations/1.json
  def update
    unless params.has_key?(:integration)
      redirect_to edit_mappings_integration_path(params[:id]), notice: 'No changes detected.' and return
    end

    params[:integration].delete :password if params[:integration][:password].blank?
    @integration = Integration.find(params[:id])

    respond_to do |format|
      if @integration.update_attributes(params[:integration])
        format.html {
          if params.has_key?(:edit_mappings)
            target = edit_mappings_integration_path(@integration)
          else
            target = edit_integration_path(@integration)
          end
          redirect_to target, notice: 'Integration was successfully updated.'
        }
        format.json { head :no_content }
      else
        format.html {
          if params.has_key?(:edit_mappings)
            target = "edit_mappings"
          else
            target = "edit"
          end
          render action: target
        }
        format.json { render json: @integration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /integrations/1
  # DELETE /integrations/1.json
  def destroy
    @integration = Integration.find(params[:id])
    @integration.destroy

    respond_to do |format|
      format.html { redirect_to integrations_url }
      format.json { head :no_content }
    end
  end
end
