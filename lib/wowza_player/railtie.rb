require 'wowza_player/view_helpers'
module WowzaPlayer
  class Railtie < Rails::Railtie
    initializer "wowza_player.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
