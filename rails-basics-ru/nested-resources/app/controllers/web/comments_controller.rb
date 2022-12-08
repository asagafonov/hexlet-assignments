module Web
  class CommentsController < ApplicationController
    before_action :set_post, only: %i[index new create]
    before_action :set_comment, only: %i[edit update destroy]

    def index
      @comments = @post.comments
    end

    def show; end

    def new
      @comment = @post.comments.build
    end

    def edit
    end

    def create
      @comment = @post.comments.build(comment_params)

      if @comment.save
        redirect_to post_path(@post), notice: 'Comment was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @comment.update(comment_params)
        redirect_to posts_url, notice: 'Comment was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @comment.destroy

      redirect_to posts_url, notice: 'Comment was successfully destroyed.'
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.permit(:body, :post_id)
    end
  end
end
