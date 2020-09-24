class Api::PostsController < ApplicationController
  def index
    if params[:name]
      @posts = Tag.find_by(name: params[:name]).posts.order(:id)
    else
      render "index.json.jb"
    end
  end
  
  def show
    @post = Post.find(params[:id])
    render "show.json.jb"
  end

  def create
    @post = Post.new(
      title: params[:title],
      body: params[:body]
    )
    if @post.save
      render "show.json.jb"
    else
      render json: "nope"
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:title] || @post.title
    @post.body = params[:body] || @post.body
    if @post.save
      render "show.json.jb"
    else
      render json: "nope"
    end
  end 

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
end
