class GiftsController < ApplicationController
	def index
		@gifts = Gift.all

		case params[:sort_by]
			when 'name'
				@gifts = Gift.find(:all, :order => "name")
			when 'price'
				@gifts = Gift.find(:all, :order => "price")
			when 'website'
				@gifts = Gift.find(:all, :order => "website")
			when 'taken'
 				@gifts = Gift.find(:all, :order => "taken")
		end
	end

  def create
    Gift.create( name:    params[:name],
    						 price:   params[:price],
    						 website: params[:website],
    						 taken:   params[:taken]
    					 )
    redirect_to gifts_path
  end

	def new
	end

	def edit
		@gift = Gift.find(params[:id])
	end

	def show
		@gift = Gift.find(params[:id])
	end

	def update
		@gift         = Gift.find(params[:id])
		@gift.name    = params[:name]
		@gift.price   = params[:price]
		@gift.website = params[:website]
		@gift.taken   = params[:taken]
		@gift.save
		redirect_to gift_path(@gift)
	end

	def destroy
		@gift = Gift.find(params[:id])
		@gift.destroy
		redirect_to gifts_path
	end

end