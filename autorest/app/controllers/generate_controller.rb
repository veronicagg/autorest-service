class GenerateController < ApplicationController
  include GenerateHelper
  def client

  end

  def create
    params.to_s
    puts "We'll pass this parameters to the AutoRest and collect gzip to be sent back."

    begin

      # file_path = ''
      # send_file file_path
      render :action => 'client'
    rescue Exception
      puts "On error we should render error page."
    end
  end
end
