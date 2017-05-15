ActiveAdmin.register Lecture do
  permit_params :content, :attachment, :course_id , :user_id


  form :partial => 'admin/lecture'

  index do
    selectable_column
    id_column
    column :content 
    
    # padding: 10px 12px 8px 12px;   border-bottom: 1px solid #e8e8e8;   vertical-align: top;   max-width: 101px !important;   overflow: hidden;
    column :attachment
    column :course
    column :user
    actions
  end


  filter :content
  filter :attachment
  filter :course_id


end


    

#  table.index_table td .hugecolumn {
#     padding: 10px 12px 8px 12px;
#     border-bottom: 1px solid #e8e8e8;
#     vertical-align: top;
#     max-width: 101px !important;
#     overflow: hidden;
# }