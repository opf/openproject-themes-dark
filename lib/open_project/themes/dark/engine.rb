module OpenProject::Themes::Dark
  class Engine < ::Rails::Engine
    engine_name :openproject_themes_dark

    initializer 'themes.dark.register_themes' do
      ActiveSupport.on_load(:themes) do
        require 'open_project/themes/dark/all'
      end
    end

    config.to_prepare do
      require 'redmine/plugin'
      require 'open_project/themes/dark/version'

      Redmine::Plugin.register 'Dark-Theme' do
        name 'Finnlabs Themes'
        author 'Finn GmbH'
        description 'Custom dark theme for OpenProject'

        url 'https://github.com/finnlabs/finnlabs-themes'
        author_url 'http://www.finn.de'

        version OpenProject::Themes::Dark::VERSION

        requires_openproject ">= 3.0.0pre42"
      end
    end
  end
end
