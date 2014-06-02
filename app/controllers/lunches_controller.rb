class LunchesController < ApplicationController
#Scooter
#    lunches GET    /lunches(.:format)          lunches#index
	def index
		@lunches = Lunch.all

		case params[:sort_by]
			when 'calories'
				@lunches = Lunch.find(:all, :order => "calories")
			when 'owner'
				@lunches = Lunch.find(:all, :order => "owner")
			when 'repeatable'
				@lunches = Lunch.find(:all, :order => "repeatable")

			when 'spiciness'
 				@lunches = Lunch.find(:all, :order => "spiciness")
			when 'meal_name'
 				@lunches = Lunch.find(:all, :order => "meal_name")
		end
	end
	
# Lena	
#            POST   /lunches(.:format)          lunches#create
  def create
    Lunch.create(meal_name:  params[:meal_name], 
    						 calories:   params[:calories], 
    						 owner:      params[:owner], 
    						 photo_url:  params[:photo_url], 
    						 repeatable: params[:repeatable], 
    						 spiciness:  params[:spiciness]
    						 )
    redirect_to lunches_path
  end
	
#Lena
#  new_lunch GET    /lunches/new(.:format)      lunches#new
	def new

	end

#Sarah 	
# edit_lunch GET    /lunches/:id/edit(.:format) lunches#edit
	def edit
		@lunch = Lunch.find(params[:id])
	end

# Scooter	
#      lunch GET    /lunches/:id(.:format)      lunches#show
	def show
		@lunch = Lunch.find(params[:id])
	end

#Sarah 
#            PUT    /lunches/:id(.:format)      lunches#update
	def update
		@lunch = Lunch.find(params[:id])
		@lunch.owner = params[:owner]
		@lunch.meal_name = params[:meal_name]
		@lunch.calories = params[:calories]
		@lunch.photo_url = params[:photo_url]
		@lunch.spiciness = params[:spiciness]
		@lunch.repeatable = params[:repeatable]
		@lunch.save
		redirect_to lunch_path(@lunch)
	end

#Scooter #May need to use form helper
#            DELETE /lunches/:id(.:format)      lunches#destroy
	def destroy
		@lunch = Lunch.find(params[:id])
		@lunch.destroy
		redirect_to lunches_path
	end 

end