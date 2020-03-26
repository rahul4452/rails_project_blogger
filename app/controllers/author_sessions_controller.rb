class AuthorSessionsController < ApplicationController
	

	def new
	end


	def create
		# byebug

		# respond_to do |format|
	 #      if login(params[:email],params[:password])
	 #        format.html { redirect_to articles_path, notice: 'Logged Succesfully' }
	 #        format.json { render :show, status: :created, location: articles_path }
	 #      else
	 #        format.html { render :new }
	 #        format.js { render json: '', status: :unprocessable_entity }
	 #      end
  #   	end

		if login(params[:email],params[:password])
			# byebug
			redirect_to(articles_path,notice: 'Logged Succesfully')
		else
			# byebug
			
			render action: :new
		end
	end

	def destroy
		logout
		redirect_to(:authors ,notice: 'Logout Succesfully')

	end


	
end
