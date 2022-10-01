# add I18n files to Rails load_path
I18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
I18n.default_locale = :ja