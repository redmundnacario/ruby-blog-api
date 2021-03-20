module Api
    module V1
        class BlogsController < ApplicationController
            def index
                blogs = Blog.order('created_at DESC')
                # blogs = Blog.all
                render json: {status: 'Success',message: 'Blogs loaded',data: blogs}, status: :ok
            end

            def show
                blog = Blog.find_by_id(params[:id])
                render json: {
                    status:"Success",
                    message: "Blog Loaded",
                    data: blog
                }, status: :ok
            end

            def create
                blog = Blog.new(blog_params)

                if blog.save
                    render json: {
                        status: "Success",
                        message: "Blog saved.",
                        data: blog
                    } , status: :ok
                else 
                    render json: {
                        status: "Error",
                        message: "Blog not saved.",
                        data: blog.errors
                    } , status: :unprocessable_entity
                end
            end

            def destroy
                blog = Blog.find_by_id(params[:id])
                blog.destroy
                render json: {
                    status: "Success",
                    message: "Blog deleted.",
                } , status: :ok
            end

            def update
                blog = Blog.find(params[:id])
                
                if blog.update(blog_params)
                    render json: {
                        status: "Success",
                        message: "Blog updated.",
                        data: blog
                    } , status: :ok
                else
                    render json: {
                        status: "Error",
                        message: "Blog not updated.",
                        data: blog.error
                    } , status: :unprocessable_entity
                end
            end

            private
            
            def blog_params
                params.require(:blog).permit(:title, :author, :content, {:tags => []}, :likes, :shares)
            end
        end
    end
end

# api/v1/blogs#index
# POST   /api/v1/blogs(.:format) api/v1/blogs#create
# api_v1_task GET    /api/v1/blogs/:id(.:format) api/v1/blogs#show
# PATCH  /api/v1/blogs/:id(.:format) api/v1/blogs#update
# PUT    /api/v1/blogs/:id(.:format) api/v1/blogs#update
# DELETE /api/v1/blogs/:id(.:format) api/v1/blogs#destroy