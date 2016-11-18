class SeriesfranchisesController < ApplicationController
  before_action :set_seriesfranchise, only: [:show, :edit, :update, :destroy]

  # GET /seriesfranchises
  # GET /seriesfranchises.json
  def index
    @seriesfranchises = Seriesfranchise.all
  end

  # GET /seriesfranchises/1
  # GET /seriesfranchises/1.json
  def show
  end

  # GET /seriesfranchises/new
  def new
    @seriesfranchise = Seriesfranchise.new
  end

  # GET /seriesfranchises/1/edit
  def edit
  end

  # POST /seriesfranchises
  # POST /seriesfranchises.json
  def create
    @seriesfranchise = Seriesfranchise.new(seriesfranchise_params)

    respond_to do |format|
      if @seriesfranchise.save
        format.html { redirect_to @seriesfranchise, notice: 'Seriesfranchise was successfully created.' }
        format.json { render :show, status: :created, location: @seriesfranchise }
      else
        format.html { render :new }
        format.json { render json: @seriesfranchise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seriesfranchises/1
  # PATCH/PUT /seriesfranchises/1.json
  def update
    respond_to do |format|
      if @seriesfranchise.update(seriesfranchise_params)
        format.html { redirect_to @seriesfranchise, notice: 'Seriesfranchise was successfully updated.' }
        format.json { render :show, status: :ok, location: @seriesfranchise }
      else
        format.html { render :edit }
        format.json { render json: @seriesfranchise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seriesfranchises/1
  # DELETE /seriesfranchises/1.json
  def destroy
    @seriesfranchise.destroy
    respond_to do |format|
      format.html { redirect_to seriesfranchises_url, notice: 'Seriesfranchise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_seriesfranchise
    @seriesfranchise = Seriesfranchise.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def seriesfranchise_params
    params.require(:seriesfranchise).permit(:series_id, :franchise_id)
  end
end
