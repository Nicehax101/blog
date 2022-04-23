class Api::V1::BooksController < ApplicationController
    before_action :fetch_author, except: %i[book_index]
    before_action :fetch_book, except: %i[index create book_index]

    def index
      @books = @author.books.all
      render json: @books
    end

    def book_index
        @books = Book.all
        render json: @books
    end
    
    def show
        render json: @book
    end
  
    def create
      @book = @author.books.new(book_create_params)  
      return render_record_errors(@book, :unprocessable_entity) unless @book.save
  
      render json: @book
    end
  
    def update
      @book.update book_update_params
      return render_record_errors(@book, :unprocessable_entity) unless @book.save
  
      render json: @book
    end
  
    def destroy
        @book.destroy
    end

    private
  
    def fetch_author
      @author = Author.find(params[:author_id])
    end

    def fetch_book
        @book = Book.find(params[:id])
    end

    def book_create_params
      params.require(:book).permit(:title, :genre)
    end

    def book_update_params
        params.require(:book).permit(:title, :genre)
    end
end
