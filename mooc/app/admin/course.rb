ActiveAdmin.register Course do
  permit_params :title, :user_id

	
  index do
    selectable_column
    id_column
    column :title
    column :user
    actions
  end


  filter :title
  filter :user
  filter :created_at



  form(:html => { :multipart => true }) do |f|
    f.inputs "Details" do
      li  do
      p   f.input :title, :class => 'input'
      end
    end
    f.actions
  end



# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
   # permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
