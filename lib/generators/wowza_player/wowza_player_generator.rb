require 'rails/generators/named_base'
require 'rails/generators/base'
class WowzaPlayerGenerator < Rails::Generators::Base
  def install
    puts "Injecting Wowza Player CDN source tag into your application layout"
    begin
      if (File.exists?('app/views/layouts/application.html.haml'))
        inject_into_file 'app/views/layouts/application.html.haml', :before => '%body' do
          "= wowza_player_script_tag\n"
        end
        puts "Please make sure the wowza_player_script_tag is indented correctly to avoid errors."
      elsif (File.exists?('app/views/layouts/application.html.erb'))
        inject_into_file 'app/views/layouts/application.html.erb', :before => '</head>' do
          "<%= wowza_player_script_tag %>\n"
        end
      else
        puts "Couldn't find HAML or ERB application layout..."
        layout_path = ask("Please specifiy a path to the layout file which contains your project's <head> element: ")
        inject_into_file layout_path, :before => '</head>' do
          "<%= wowza_player_script_tag %>\n"
        end
      end
    rescue => e
      puts "Unable to install the Wowza Player please do so manually."
    end

  end
end
