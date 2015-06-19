class FavouritesController < ApplicationController
	def index
		@favourites = Favourite.all
	end

	def new
		@favourite = Favourite.new
	end

	def create
		@favourite = Favourite.new(favourite_params)
		if @favourite.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def destroy
		@favourite = Favourite.find(params[:id])
		@favourite.destroy
		redirect_to posts_path
	end

	private

	def favourite_params
		params.require(:favourite).permit(:user_id, :post_id)
	end
end