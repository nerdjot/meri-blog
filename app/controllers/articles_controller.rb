class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new  #this written to prevent article.error.any NULL error while rendering new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit( :description, :title))
    if @article.save
      flash[:notice] = "Article was created successfully."
      #redirect_to article_path(@article)
      redirect_to @article  #redirect to show of newly created article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:description, :title))
      flash[:notice] = "Article was created successfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

end