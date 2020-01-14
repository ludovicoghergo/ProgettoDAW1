class CommentsController < ApplicationController
skip_before_action :authorized, only: [:new, :create]
def index
  @comments = Comment.all
end

def new
end

def create
  @comment = Comment.create(title: params[:title], text: params[:text],user_id: params[:user_id], product_id: params[:product_id])
  @comment.save
  redirect_back(fallback_location: root_path)
end


def show
  @comment = Comment.find(params[:id])
end
end
