class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all.order(:created_at)
    @order_item = current_order.order_items.new
    if params[:search]
      @books = Book.search(params[:search]).order("created_at DESC")
    else
      @books = Book.all.order('created_at DESC')
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.coverart = params[:file]
    @book.manuscript = params[:file]
    respond_to do |format|
      if @book.save
        Author.create(book_id: @book.id, user_id: session[:user_id])
        format.html { redirect_to @book, notice: 'Book was successfully published.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def buynow
    Purchase.create(book_id: @book.id, user_id: session[:user_id])
    @order_item = OrderItem.where(book_id: @book.id, session[:order_id])
    if (@order_item.nil?)
      @order_item.destroy
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:title, :price, :words, :published, :synopsis)
  end
end
