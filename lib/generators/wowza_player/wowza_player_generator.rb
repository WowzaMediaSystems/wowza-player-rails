require 'rails/generators/named_base'
require 'rails/generators/base'
class WowzaPlayerGenerator < Rails::Generators::Base
  def create_initializer_file
    ask "hello world"
    # create_file "config/initializers/initializer.rb", "# Add initialization content here"
  end
end
