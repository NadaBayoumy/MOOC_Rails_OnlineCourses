ActiveAdmin.register User do
	permit_params :email, :password, :password_confirmation, :name, :birthdate, :gender, :picture
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

  # controller do
  #   def permitted_params
  #     params.permit user: [:email, :name, :birthdate]
  #   end
  # end


	# form :partial => 'admin/user'



  index do
    selectable_column
    id_column
    column :email
    column :name
    column :birthdate
    column :created_at
    actions
  end




   show do |u|
      #     h3 user.name

      # div do
      #     # user.email
      #     # user.birthdate
         

      # end

      default_main_content
      active_admin_comments
      # active_admin_like
      # h3 u.email
  end



  filter :email
  filter :name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at


  action_item :view do
    link_to 'Manage Admininstrators', admin_admin_users_path()
  end
  



  form(:html => { :multipart => true }) do |f|
    f.inputs "Normal User Details" do
      f.input :name, :class => 'form-control'

      li  do
      p   f.label "email", :class => 'label'
      p   f.email_field :email, :class => 'input'
      end

      li  do
      p  f.label "password", :class => 'label'
      p  f.password_field :password, :class => 'input'
      end


      li do
      p  f.label "confirm password", :for => :password_confirmation, :class => 'label'
      p  f.password_field :password_confirmation, :class => 'input'
      end

    end


    f.inputs "Extra User Details" do
      li do
      f.label "date of birth", :class => 'label'
      f.date_field :birthdate , :style => 'width:65%'
      end 

      li do
      f.radio_button :gender, true
      f.label "male", :class => 'label'
    end
      li do
      f.radio_button :gender, false
      f.label "female", :class => 'label'
      end
      li do
      f.input :picture, :class => ''
      end
    end
    f.actions
  end



#   form do |f|              
#     render partial: 'form'                        
# end  

  # form do |f|
  #   f.semantic_errors # shows errors on :base
  #   f.inputs only: [:email, :password, :password_confirmation, :name, :birthdate, :gender, :picture]         
  #   # builds an input field for every attribute
  #   f.actions         # adds the 'Submit' and 'Cancel' buttons
  # end


  # form partial: '/home/nada/Desktop/railsFinalProject/mooc/app/views/users/_form.html.erb'

  # form title: 'Normal User Details' do |f|
  #   inputs 'Details' do
  #     input :name     
  #     input :email

  #   end
   
    
  # end







end
