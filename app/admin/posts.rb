ActiveAdmin.register Post do
  permit_params :title, :description, :body, :tags, :published, :image, :slug

  form do |f|
    f.inputs 'Page' do
      f.input :title
      f.input :description
      f.input :body, as: :froala_editor
      f.input :slug
      f.input :image, as: :file
      f.input :tags
      f.input :published
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :body
      row :image do |ad|
        image_tag url_for(ad.image)
      end
    end
  end
end
