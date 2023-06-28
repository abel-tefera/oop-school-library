require_relative 'app'
require_relative 'home'

def main
  app = App.new
  app.generate_saved_data

  home(app)
end

main
