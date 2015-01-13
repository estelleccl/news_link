require 'yaml'

unless Rails.env.production?
	yaml_data = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'application.yml'))).result)
	APP_CONFIG = HashWithIndifferentAccess.new(yaml_data)
	
  ENV['FB_API_KEY'] = APP_CONFIG[:api_key]
  ENV['FB_SECRET_KEY'] = APP_CONFIG[:secret_key]
end