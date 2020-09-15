ActiveAdmin.register User do
  remove_filter :reset_password_token, :reset_password_sent_at, :confirmation_token, :confirmed_at, :confirmation_sent_at
  actions :all, :except => [:new]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :name, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :name, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
   index do
     selectable_column
     column :id
     column :name
     column :email
     column :admin
     column :created_at
     column :updated_at
     actions       
   end

end
