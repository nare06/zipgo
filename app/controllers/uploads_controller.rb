class UploadsController < ApplicationController
	before_filter :authenticate_user!

	def upload
		@upload = Upload.new(upload_params)
		@upload.user_id = current_user.id
		respond_to do |format|
      # begin
      	@upload.save! 
        if @upload.process
        	format.html { redirect_to root_path, notice: 'Upload was successful and file processed' }
        else
        	format.html { redirect_to root_path, notice: 'Upload was successful. Wrong formatting inside the file'}
        end
	        # format.json { render action: 'show', status: :created, location: @upload }
	    # rescue
        
     #    format.html { redirect_to root_path, notice: 'Upload not successful. File format not supported. Only csv files are allowed'}
	    #     # format.json { render json: @product.errors, status: :unprocessable_entity }
	    # end
	  end
	end

	private

	def upload_params
		params.require(:upload).permit(:file)
	end
end
