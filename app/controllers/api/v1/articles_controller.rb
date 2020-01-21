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
end
