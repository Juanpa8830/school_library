module ExtraMethods
  def save_data
    save_books
    save_users
    save_rentals
  end

  def save_books
    File.open('info/books.json', 'w') { |f| f << @books.to_json }
  end

  def save_users
    File.open('info/users.json', 'w') { |f| f << @users.to_json }
  end

  def save_rentals
    File.open('info/rentals.json', 'w') { |f| f << @rentals.to_json }
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
    information.map do |user|
      if user['class'] == 'Student'
        @users.push(Student.new(user['age'], user['name'], user['id'],
                                parent_permission: user['parent_permission']))
      else
        @users.push(Teacher.new(user['age'], user['specialization'], user['name'], user['id'],
                                parent_permission: user['parent_permission']))
      end
    end
  end

  def load_rentals
    return unless File.exist?('info/rentals.json') && File.size?('info/rentals.json')

    JSON.parse(File.read('info/rentals.json')).each do |rental|
      rent_user_id = @users.find { |user| user.id == rental['person'] }
      rent_book_title = @books.find { |book| book.title == rental['book_title'] }
      @rentals.push(Rental.new(rental['date'], rent_book_title, rent_user_id))
    end
  end
end
