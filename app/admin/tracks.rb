ActiveAdmin.register Track do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  belongs_to :simulator, optional: true
  permit_params :name, :simulator_id
  # permit_params :name, :simulator_id
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

      column "Track Name", :name do |track|
        link_to track.name, admin_track_path(track)
      end
   
    actions
  end

  controller do 

      def create
        @track = Track.create(permitted_params[:track])
        if @track.save
          redirect_to admin_tracks_path
          flash[:notice] = "Track created!"
        else
          render :new
        end
      end
  end

  form do |f|
      f.semantic_errors *f.object.errors.keys
      # Model's own fields:
      f.inputs "Details" do
        f.input :name, label: "Track Name"
      end
      f.actions
  end
 
end

