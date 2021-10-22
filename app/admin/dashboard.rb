include LastFmHelper

ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    
    columns do

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
      column do
        panel "Recent Track" do
          span class: "blank_slate" do
            p get_current_track_from_last_fm()
          end
        end
      end
      column do
        panel "Recent Pages" do
          ul do
            Page.all.limit(5).map do |page|
              li link_to(page.title, admin_page_path(page))
            end
          end
        end
      end

    end
  end # content
end
