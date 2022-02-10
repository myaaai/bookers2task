class BooksController < ApplicationController

    def new
      @book = Book.new
    end
    def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @user = current_user
     @books = Book.all
     if @book.save
      flash[:notice] ="Book was successfully created."
     redirect_to book_path(@book.id)
     else
     render :index
     end
    end

    def index
     @books = Book.all
     @book = Book.new
     @user = current_user
    end

    def show
     @book = Book.find(params[:id])
     @user = @book.user
     @newbook = Book.new
    end

    def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] ="Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    render :edit
    end

    end

    def edit
      @book = Book.find(params[:id])
      if @book.user != current_user
        redirect_to books_path
      end
    end

    def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
    end




private

  def book_params
    params.require(:book).permit(:title, :body)

  end

end

