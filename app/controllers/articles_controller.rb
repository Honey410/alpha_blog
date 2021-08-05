class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])

    end   
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
           #render plain: params[:article]   #it just shows but didn't save in DB

        #for saving in DB(Articles table)
        @article = Article.new(params.require(:article).permit(:title, :description))
        #@article.save
         #redirect_to article_path(@article)
        #redirect_to @article  #shorthend 
        if @article.save
          flash[:notice] = "Article was created successfully."
          redirect_to @article
        else
          render 'new'
        end
    end 
    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
          flash[:notice] = "Article was updated successfully."
          redirect_to @article
        else
          render 'edit'
        end
      end 
    
end