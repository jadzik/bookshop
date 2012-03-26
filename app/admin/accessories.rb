#encoding: utf-8
ActiveAdmin.register Accessory do
  ActiveAdmin.register Accessory do
    menu :parent => "Accessory"
      show do
        panel "Dodaj zdjęcie" do
          render "accessory"
        end
        default_main_content
      end
  end

  ActiveAdmin.register CategoryAccessory do
    menu :parent => "Accessory"
  end

end
