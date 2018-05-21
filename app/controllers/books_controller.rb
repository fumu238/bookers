class BooksController < ApplicationController
  
  def index
      @books = Book.all
      @book = Book.new
  end

  def show
      @show = Book.find(params[:id])
  end

  def new
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
       book = Book.find(params[:id])
        if book.update(book_params)
          flash[:notice] = "投稿を編集しました"
        end
       redirect_to book_path(book)
  end

  def create
      book = Book.new(book_params)
      if book.save
      flash[:notice] = "投稿を作成しました"
      redirect_to book_path(book)
      else
      redirect_to books_path
      end
  end

  def top
  end


  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
      def book_params
        params.require(:book).permit(:title, :body)
      end

end
