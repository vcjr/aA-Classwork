class CommentsController < ApplicationController
    def index
        if params.has_key?(:user_id)
            @comments = Comment
                            .joins(:user)
                            .where("users.id = ?", params[:user_id])
            render json: @comments
        elsif params.has_key?(:artwork_id)
            @comments = Comment
                            .joins(:artwork)
                            .where("artworks.id = ?", params[:artwork_id])
            render json: @comments
        end
    end


    def create
        @comment = Comment.new(comments_params)

        if @comment.save
            render json: @comment
        else
           render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        if @comment.destroy
            render json: @comment
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end


    private

    def comments_params
        params.require(:comment).permit(:user_id, :body, :artwork_id)
    end
end