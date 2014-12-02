
class Book
  attr_accessor :title, :author, :id, :status

  def initialize(title, author)
    @title = title
    @author = author
    @id = nil
    @status = 'available'
  end

  def check_out
    if @status == 'checked_out'
      return false;
    else
      @status = 'checked_out'
      return true;
    end
  end

  def check_in
    @status = 'available'
  end

end

class Borrower
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Library
  attr_accessor :name, :books, :counter, :id

  def initialize(name)
    @name = name
    @books = []
    @counter = 0
    @borrower = {}
  end

  def books
    books = @books
  end

  def register_new_book(title, author)
   title = Book.new(title, author)
   title.id = @counter
   @books << title
   @counter += 1
  end

  def check_out_book(book_id, borrower)
    # how many books has the borrower checked out? return nil if it's already checked out
    if @borrower.select {|k,v| v == borrower}.count > 1
      return nil
    else
     # else give the borrower the available book and assign book_id to borrower
     @borrower[book_id] = borrower
     @books[book_id].status = 'checked_out'
     @books[book_id]
    end
  end

  def get_borrower(book_id)
    @borrower.fetch(book_id).name
  end

  def check_in_book(book)
  end

  def available_books
  end

  def borrowed_books
  end
end
