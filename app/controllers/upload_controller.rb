class UploadController < ApplicationController
  def get
  end

  def post
    uploaded_io = params[:results]
    process_file(uploaded_io.tempfile)
  end
end
