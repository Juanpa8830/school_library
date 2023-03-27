require_relative 'app'
#require_relative 'book'

def main
  app = App.new
  app.start
  app.save_data
  puts 'Thanks for using this app!'
end

def selected_menu_option
  puts '@@@@@@@@@@ SCHOOL LIBRARY APP @@@@@@@@@@@'
  puts "\nPlease choose an option by entering a number: "
  puts '1 - List all books.'
  puts '2 - List all people.'
  puts '3 - Create a person,'
  puts '4 - Create a book.'
  puts '5 - Create a rental.'
  puts '6 - List all rentals for a given person id.'
  puts '7 - Exit'

  get_option_selected(1, 7)
end

main
