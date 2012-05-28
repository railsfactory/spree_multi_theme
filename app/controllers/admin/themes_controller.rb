#~ class Admin::ThemesController < Spree::BaseController
#~ class Admin::ThemesController < ApplicationController
	class Admin::ThemesController < Spree::Admin::BaseController
	 
	 # To select your theme 
	 def new
		 @options=THEME_OPTIONS["options"].split(' ')
	 end
	 
	 # Theme name is write into sandbox/config/*.yml file
	 def create
		 system "echo theme: \\'#{params[:option]}\\' >  #{Rails.root}/config/settings.yml"
		 Rails.env
		 if Rails.env != "production"
			 #~ pid=%x{cat tmp/pids/server.pid}
			 #~ system "kill -9 #{pid}"
		 else
			 system " touch #{Rails.root}/tmp/restart.txt"
		 end
		 p 44444444444444444444444444444444444444444444
		 #~ p paths["app/assets"]
		 #~ config.autoload_paths = File.expand_path("../../../../lib/spree_odg_theme", __FILE__)
		 #~ load File.expand_path("../../../../lib/spree_odg_theme.rb", __FILE__)
		 #~ load File.expand_path("../../../../config/initializers/load_config.rb", __FILE__)
		 #~ %x{for m in "`ls ../spree_odg_theme/themes`"; do echo "options: \\"$m\\"" > ../spree_odg_theme/config/themes.yml ; done}
		 #~ system "rake assets:clean"
		 #~ system "rake assets:precompile"
		 flash[:notice] = "Store Panel layout is Changed as #{params[:option]}"
		 redirect_to "/admin/themes/new"
	 end

	 
end
