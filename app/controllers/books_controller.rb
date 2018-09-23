class BooksController < ApplicationController
      before_action :authenticate_user!
	def new
	end

	def index
		@user = current_user
		@book = Book.new
		@books = Book.all
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = current_user
		if @book.save
		   flash[:success] = 'Book was successfully created'
		redirect_to book_path(@book.id)
	else
		render 'users/show'
	end
	end

	def show
		@book = Book.new
		@books = Book.find(params[:id])
		@user = @books.user
	end

	def edit
		@books = Book.find(params[:id])
	end

	def update
		@books = Book.find(params[:id])
		@books.update(book_params)
		flash[:success] = 'Book was successfully updated'
		redirect_to book_path
	end

	def destroy
		@books = Book.find(params[:id])
		@books.destroy
		flash[:success] = 'Book was successfully destroyed.'
		redirect_to books_path
	end

	private

	def corect_user
      book = Book.find(params[:id])
      if current_user != book.user
        redirect_to users_path
      end
    end

	def book_params
		params.require(:book).permit(:title, :user_id, :opinion, :user_id)
	end

end
