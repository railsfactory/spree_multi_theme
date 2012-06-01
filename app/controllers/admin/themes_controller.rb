class Admin::ThemesController < Spree::Admin::BaseController

   # To select your theme
   def new
     @options=THEME_OPTIONS["options"].split(' ')
   end

   # Theme name is write into sandbox/config/*.yml file
   def create
     system "echo theme: \\'#{params[:option]}\\' >  #{Rails.root}/config/settings.yml"
     if Rails.env == "production"
      system "touch #{Rails.root}/tmp/restart.txt"
      flash[:notice] = "Store Panel layout is Changed as #{params[:option]}"
     else
       load File.expand_path("../../../../config/initializers/load_config.rb", __FILE__)
       flash[:notice] = "Store Panel layout is Changed as #{params[:option]} Please restart your server"
     end
     redirect_to "/admin/themes/new"
   end

end
