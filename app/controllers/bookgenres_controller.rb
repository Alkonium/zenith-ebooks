class BookgenresController < ApplicationController
  before_action :set_bookgenre, only: [:show, :edit, :update, :destroy]

  # GET /bookgenres
  # GET /bookgenres.json
  def index
    @bookgenres = Bookgenre.all
  end

  # GET /bookgenres/1
  # GET /bookgenres/1.json
  def show
  end

  # GET /bookgenres/new
  def new
    @bookgenre = Bookgenre.new
  end

  # GET /bookgenres/1/edit
  def edit
  end

  # POST /bookgenres
  # POST /bookgenres.json
  def create
    @bookgenre = Bookgenre.new(bookgenre_params)

    respond_to do |format|
      if @bookgenre.save
        format.html { redirect_to @bookgenre, notice: 'Bookgenre was successfully created.' }
        format.json { render :show, status: :created, location: @bookgenre }
      else
        format.html { render :new }
        format.json { render json: @bookgenre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookgenres/1
  # PATCH/PUT /bookgenres/1.json
  def update
    respond_to do |format|
      if @bookgenre.update(bookgenre_params)
        format.html { redirect_to @bookgenre, notice: 'Bookgenre was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookgenre }
      else
        format.html { render :edit }
        format.json { render json: @bookgenre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookgenres/1
  # DELETE /bookgenres/1.json
  def destroy
    @bookgenre.destroy
    respond_to do |format|
      format.html { redirect_to bookgenres_url, notice: 'Bookgenre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookgenre
      @bookgenre = Bookgenre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookgenre_params
      params.require(:bookgenre).permit(:book_id, :genre_id)
    end
end
