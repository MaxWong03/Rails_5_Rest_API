class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.order('created_at DESC');
    render json: {
      status: 'SUCCESS',
      messages: 'Loading articles',
      data: articles
    },
    status: :ok
  end

  def show
    article = Article.find(params[:id])
    render json: {
      status: 'SUCCESS',
      message: 'Loading single article',
      data: article
    },
    status: :ok
  end
  
  def create
    article = Article.new(article_params)

    if article.save
      render json: {
      status: 'SUCCESS',
      message: 'Saving single article',
      data: article
      },
      status: :ok
    else 
      render json: {
        status: 'ERROR',
        message: 'Article not saved',
        data: data.article.errors
      },
      status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.permit(:title, :body)
  end
end
