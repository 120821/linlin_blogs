module Interface
  class BlogsController < ApplicationController
    def all

      #blog = Blog.first
      #result = {
      #  id: blog.id,
      #  title: blog.title,
      #  content: blog.content
      #}

      result = Blog.all.map do |blog|

        # 这个是返回值，在map 中，不能写return, 默认返回最后一行代码的值
        {
          id: blog.id,
          title: blog.title,
          content: blog.content
        }
      end

      render json: result
    end
  end
end
