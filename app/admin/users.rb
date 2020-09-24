ActiveAdmin.register User do
  remove_filter :reset_password_token, :reset_password_sent_at, :confirmation_token, :confirmed_at, :confirmation_sent_at
  
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
