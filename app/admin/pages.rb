ActiveAdmin.register Page do

  permit_params :title, :description, :body, :published, :slug, :has_hero, :hidden, :position

  form do |f|
    f.inputs 'Page' do
      f.input :title
      f.input :description
      f.input :body, as: :froala_editor
      f.input :slug
      f.input :position
      f.input :published
      f.input :hidden
      f.input :has_hero
    end
    f.actions
  end
end
