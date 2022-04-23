class Api::V1::AuthorsController < ApplicationController
    before_action :fetch_author, except: %i[index create]

    def index
      @authors = Author.all
      render json: @authors
    end

    def show
        render json: @author
    end
  
    def create
      @author = Author.new(author_create_params)  
      return render_record_errors(@author, :unprocessable_entity) unless @author.save
  
      render json: @author
    end
  
    def update
      @author.update author_update_params
      return render_record_errors(@author, :unprocessable_entity) unless @author.save
  
      render json: @author
    end
  
    def destroy
        @author.destroy
    end

    private
  
    def fetch_author
      @author = Author.find(params[:id])
    end
  
    def author_create_params
      params.require(:author).permit(:name)
    end

    def author_update_params
        params.require(:author).permit(:name)
    end
end
