class PostsController < ApplicationController
        #before_action :set_posts, [:show, :update, :destroy, :posts]
        #before_action :authenticate_request

        def index
          posts = Post.all 
          render json: posts, status: :ok
        end

        def show
          render json: @post, status: :ok
        end

        def create
          post = @current_user.posts.new(user_params)

          if post.save
            render json: @post, status: :created
          else
            render json: @post.errors, status: :unprocessable_entity
          end
        end
      
        def update
          if @post.update(post_params)
            render json: @post, status: :ok
          else
            render json: @post.errors, status: :unprocessable_entity
          end
        end
      
        def destroy
          if @post.destroy
            render json: nil, status: :ok
          else
            render json: @post.errors, status: :unprocessable_entity
          end
        end

        private
      
        def set_posts
          @post = Post.find(params[:id] || params[:post_id])
        end
      
        def post_params
          #permit only allows the parameters included in the argument
          params.permit(:content)
        end
      
end
