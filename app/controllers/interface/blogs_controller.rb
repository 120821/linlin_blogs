require 'base64'
require 'upyun'

module Interface
  class BlogsController < ApplicationController::Base
    #class Interface::BlogsController < ActionController::Base
    def upload_paste_image_to_cdn
      bucket = Settings.upyun.bucket
      operator = Settings.upyun.operator
      password = Settings.upyun.password

      base_64_encoded_data = params[:image_content]

      unless base_64_encoded_data.include?("data:image/png;base64,")
        raise "It's not an png image"
        return
      end

      local_file = 'temp.png'
      File.open(local_file, 'wb') do |f|
        f.write(Base64.decode64(base_64_encoded_data.gsub("data:image/png;base64,", '')))
      end
      upyun = Upyun::Rest.new(bucket, operator, password)
      remote_file = "/blog_images/from_paste_#{Time.now.strftime('%Y%m%d_%H%M%S')}.png"

      response = upyun.put remote_file, local_file
      render :json => {
        :response => response,
        #这个是网址，有用的就是这里
        :url => "https://files.sweetysoft.com#{remote_file}",
      }
    end
  end
end

#module Interface
#  class BlogsController < ApplicationController
#    def all

#      #blog = Blog.first
#      #result = {
#      #  id: blog.id,
#      #  title: blog.title,
#      #  content: blog.content
#      #}

#      result = Blog.all.map do |blog|

#        # 这个是返回值，在map 中，不能写return, 默认返回最后一行代码的值
#        {
#          id: blog.id,
#          title: blog.title,
#          content: blog.content
#        }
#      end

#      render json: result
#    end
#  end
#end
