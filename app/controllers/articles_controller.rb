class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(articles_params)
    if @article.save
      flash[:notice] = "Articles was sucessfully created!!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(articles_params)
      flash[:notice] = "Article was sucessfully created!!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  
  end
  
  def show
    @article = Article.find(params[:id])
  end

  private
    def articles_params
      params.require(:article).permit(:title, :description)
    end
end