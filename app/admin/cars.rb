ActiveAdmin.register Car do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  belongs_to :simulator, optional: true
  permit_params :name, :simulator_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :simulator_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  actions :all, :except => :new
  index do
      selectable_column

      column "Car Name", :name do |car|
        link_to car.name, admin_car_path(car)
      end
   
    actions
  end

  controller do 

      def create
        @car = Car.create(permitted_params[:car])
        if @car.save
          redirect_to admin_cars_path
          flash[:notice] = "Car created!"
        else
          render :new
        end
      end
  end

  form do |f|
      f.semantic_errors *f.object.errors.keys
      # Model's own fields:
      f.inputs "Details" do
        f.input :name, label: "Car Name"
      end
      f.actions
  end
 
end
