ActiveAdmin.register Product do
  menu :parent => "Produkty"
    show do
      attributes_table :id, :created_at, :updated_at, :resource_id, :resource_type
      active_admin_comments
    end
end

ActiveAdmin.register NewProduct do
  menu :parent => "Produkty"
    form :html => { :multipart => true } do |f|
      f.inputs "New products" do
        f.input :resource_id
        f.input :resource_type, :as => :select, :collection => ["Book", "Game", "Accessory"]
      end
      f.buttons
    end
    show do
      panel "Dodaj" do
        render "new"
      end
      default_main_content
    end 
end
