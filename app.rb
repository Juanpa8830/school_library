require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require 'json'

class App
  def initialize
    @books = []
    @users = []
    @rentals = []
    load_data
  end

  def books_list
    if @books.empty?
      puts "Add a new book first"
    else
    list = ''
    @books.each_with_index { |book, i| list << "\n[#{i + 1}]. Title: #{book.title}, Author: #{book.author}" }
    list << "\n"
    end
  end

  def users_list
    if @users.empty?
      puts "Add a new user first"
    else
    list = ''
    @users.each_with_index do |user, i|
      list << "\n[#{i + 1}]. id:#{user.id} class:#{user.class}  name: #{user.name}, age: #{user.age}"
    end
    list << "\n\n"
  end
  end

  def rentals_list
    if @rentals.empty?
      puts "Add a new rental first"
    else
    list = ''
    @rentals.each_with_index do |rental, i|
      list << "\n[#{i + 1}]. date:#{rental.date} book:#{rental.book.title}  owner: #{rental.person.name}"
    end
    list << "\n\n"
  end
  end

  def start
    loop do
      option = selected_menu_option
      case option
      when 1
        puts books_list
      when 2
        puts users_list
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        puts user_rentals
      else
        break
      end
      wait_user
    end
  end

  def wait_user
    puts 'Press any key to continue...'
    gets.chomp
    puts ''
  end

  def create_book
    puts "\nInput the book data:"
    print 'Input Title: '
    title = gets.chomp
    print 'Input Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts "\nBook created successfully.\n"
  end

  def create_person
    puts "\Do you want to create a student (1) or a teacher (2)? type the number: "
    option = get_option_selected(1, 2)

    case option
    when 1
      add_student
    when 2
      add_teacher
    end
  end


  def create_rental
    if @books.empty? || @users.empty?
      puts "your books list or users list is empty. plase add a book/user first"
    else
    puts "\nselect a book from the following list, by number:"
    puts books_list
    book_number = get_option_selected(1, @books.length)
    selected_book = @books[book_number - 1]
    puts "\nselect a person from the following list, by number:"
    puts users_list
    user_number = get_option_selected(1, @users.length)
    selected_user = @users[user_number - 1]
    puts "\ninsert the date of this rental:"
    date = gets.chomp
    rental = Rental.new(date, selected_book, selected_user)
    @rentals.push(rental) unless rental.nil?
    puts "\nrental created successfully.\n"
    end
 end

  def user_rentals
    print 'Input user id: '
    id = gets.chomp
    person = @users.find { |per| per.id == id }
    person.nil? ? "There isn't a person with that id\n" : person.rental_list
  end

  def get_option_selected(first, last)
    option = ''
    loop do
      option = gets.chomp.to_i
      break if option >= first && option <= last

      print 'select a valid option '
    end
    option
  end

  def permission?
    print 'has parent permission? [Y/N]'
    answer = gets.chomp.capitalize
    return true unless answer == 'N'
    false
  end

  def add_student
    puts "\nInput the student data:"
    print 'Input student name: '
    name = gets.chomp
    print 'Input student age: '
    age = gets.chomp.to_i
    permiso = age >= 18 ? true : permission?
    person = Student.new(age, name, parent_permission: permiso)
    @users.push(person)
    puts "\nstudent created successfully.\n"
  end

  def add_teacher
    puts "\nInput the teacher data:"
    print 'Input teacher name: '
    name = gets.chomp
    print 'Input teacher age: '
    age = gets.chomp.to_i
    print 'Input teacher specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    @users.push(person)
    puts "\nteacher created successfully.\n"
  end

  def save_data
    save_books
    save_users
    save_rentals
  end


  def save_books
    File.open('info/books.json', 'w') { |f| f << @books.to_json }
  end
  def save_users
    File.open('info/users.json', 'w'){ |f| f << @users.to_json }
  end
  def save_rentals
    File.open('info/rentals.json', 'w'){ |f| f << @rentals.to_json }
  end

  def load_data
    load_books
    load_users
    load_rentals
   end

  def load_books
    return unless File.exist?('info/books.json') && File.size?('info/books.json')
    information = JSON.parse(File.read('info/books.json'))
    information.map { |book| @books.push(Book.new(book['title'], book['author'])) }
  end

  def load_users
    return unless File.exist?('info/users.json') && File.size?('info/users.json')
    information = JSON.parse(File.read('info/users.json'))
    information.map do 
      |user| if user['class'] == 'Student'
             @users.push(Student.new(user['age'], user['name'], user['id'], parent_permission: user['parent_permission'] )) 
             else
            @users.push(Teacher.new(user['age'], user['specialization'], user['name'], user['id'], parent_permission: user['parent_permission'] )) 
            end
      end
  end

  def load_rentals
    return unless File.exist?('info/rentals.json') && File.size?('info/rentals.json')
  
    JSON.parse(File.read('info/rentals.json')).each do |rental|
      rent_user = @users.find { |user| user.id == rental["person"]["id"] }
      rent_book = @books.find { |book| book.title == rental["book"]["title"] }
      @rentals.push(Rental.new(rental["date"], rent_book, rent_user))
    end
  end
 
end

