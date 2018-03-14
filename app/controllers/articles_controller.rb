class ArticlesController < ApplicationController

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'Article successfully created'
      redirect_to article_path(@article)
    else
      if params[:title].blank? || params[:body].blank?
        flash[:error] = "Please fill in both Title and Content"
      end
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
