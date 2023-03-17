require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'person'
require_relative 'app'

def main
  app = App.new
  app.start
  puts 'Thanks for using this app!'
end

main
