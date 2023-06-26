require_relative 'app'
require_relative 'home'

def main
  app = App.new

  home(app)
end

main
