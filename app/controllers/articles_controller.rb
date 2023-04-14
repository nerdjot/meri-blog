class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] #run the function right before calling these functions

  def show
    #@article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new  #this written to prevent article.error.any NULL error while rendering new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def create
    @article = Article.new(get_article_params)#works because ruby just calls it, not a func ptr
    if @article.save
      flash[:notice] = "Article was created successfully."
      #redirect_to article_path(@article)
      redirect_to @article  #redirect to show of newly created article
    else
      render 'new'
    end
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(get_article_params)
      flash[:notice] = "Article was created successfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def get_article_params
    params.require(:article).permit(:description, :title) #works because ruby returns last line
  end

end