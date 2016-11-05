class BookseriesController < ApplicationController
  before_action :set_bookseries, only: [:show, :edit, :update, :destroy]

  # GET /bookseries
  # GET /bookseries.json
  def index
    @bookseries = Bookseries.all
  end

  # GET /bookseries/1
  # GET /bookseries/1.json
  def show
  end

  # GET /bookseries/new
  def new
    @bookseries = Bookseries.new
  end

  # GET /bookseries/1/edit
  def edit
  end

  # POST /bookseries
  # POST /bookseries.json
  def create
    @bookseries = Bookseries.new(bookseries_params)

    respond_to do |format|
      if @bookseries.save
        format.html { redirect_to @bookseries, notice: 'Bookseries was successfully created.' }
        format.json { render :show, status: :created, location: @bookseries }
      else
        format.html { render :new }
        format.json { render json: @bookseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookseries/1
  # PATCH/PUT /bookseries/1.json
  def update
    respond_to do |format|
      if @bookseries.update(bookseries_params)
        format.html { redirect_to @bookseries, notice: 'Bookseries was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookseries }
      else
        format.html { render :edit }
        format.json { render json: @bookseries.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookseries/1
  # DELETE /bookseries/1.json
  def destroy
    @bookseries.destroy
    respond_to do |format|
      format.html { redirect_to bookseries_index_url, notice: 'Bookseries was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookseries
      @bookseries = Bookseries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookseries_params
      params.require(:bookseries).permit(:book_id, :series_id, :position)
    end
end
