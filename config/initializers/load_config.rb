APP_THEME = YAML.load_file("#{Rails.root}/config/settings.yml")
#~ THEME_OPTIONS = YAML.load_file("config/themes.yml")
THEME_OPTIONS = YAML.load_file(File.expand_path("../../themes.yml", __FILE__))
