ActiveAdmin.register Simulator do

   	permit_params :name, tracks_attributes: [:id, :_destroy, :name]

 	index do
        selectable_column
        column "Simulator Name", :name do |simulator|
      		link_to simulator.name, admin_simulator_path(simulator)
        end
   
	    column "Number of Tracks", :tracks_of_simulator do |simulator|
	      link_to simulator.tracks.count, admin_simulator_tracks_path(simulator)
	    end

	    column "Number of Cars", :cars_of_simulator do |simulator|
	      link_to simulator.cars.count, admin_simulator_cars_path(simulator)
	    end
   
    	actions
  	end

	  form do |f|

	    # Model's own fields:
	    f.inputs "Details" do
	    	f.input :name, label: "Simulator Name"
	    end
	    
	    # Child model fields, using the "has_many" method:
	    f.inputs "Tracks" do
	    	f.has_many :tracks, heading: false, allow_destroy: true do |o|
	      		o.input :name, label: "Track Name"
	      	end
	    end
	    f.actions

		f.inputs "Cars" do
	      	f.has_many :cars, heading: false, allow_destroy: true do |c|
	      		c.input :name, label: "Car Name"
	    	end
	    end
	    f.actions
	  end
 
	  controller do
	    def show
	      redirect_to admin_simulator_tracks_path(resource)
	    end
	  end
  
end
