require 'rails/generators/named_base'
require 'rails/generators/base'
class WowzaPlayerGenerator < Rails::Generators::Base
  def install
    puts "***"*20
    puts "Injecting Wowza Player CDN source tag into your application layout \n"
    begin
      if (File.exists?('app/views/layouts/application.html.haml'))
        inject_into_file 'app/views/layouts/application.html.haml', :after => "%head" do
          "\n    = wowza_player_script_tag\n"
        end
        puts "---"*20
        puts "Please make sure the wowza_player_script_tag was injected to your liking in app/views/layouts/application.html.haml"
      elsif (File.exists?('app/views/layouts/application.html.erb'))
        inject_into_file 'app/views/layouts/application.html.erb', :before => "</head>" do
          "<%= wowza_player_script_tag %>\n"
        end
      else
        puts "Couldn't find HAML or ERB application layout..."
        layout_path = ask("Please specifiy a path to the layout file which contains your project's <head> element: ")
        inject_into_file layout_path, :before => '</head>' do
          "<%= wowza_player_script_tag %>\n"
        end
      end

      puts "Wowza Player source has been installed to you app"
      puts "***"*20
      puts <<-EOS
        The Wowza Player is now available as a helper to use in your Rails templates

        ERB:
          <% = wowza_player_tag(license: <your-wowza-player-license>, sourceURL: <hls-source-url>) %>

        HAML:
          = wowza_player_tag(license: <your-wowza-player-license>, sourceURL: <hls-source-url>)
      EOS
    rescue => e
      puts "Unable to install the Wowza Player, please do so manually."
    end

  end
end
