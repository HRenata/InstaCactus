class CommentsController < ApplicationController
    before_action :find_post

    def find_post
        @post=Post.find(params[:post_id])
    end

    def create
        @comment=@post.comments.create(params[:comment].permit(:text))
        @comment.user_id=current_user.id
        @comment.save
        if @comment.save
            redirect_to post_path(@post.user_id, @post.id)
        else
            render 'new'
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
end
