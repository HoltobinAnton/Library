
require_relative 'book.rb'
require_relative 'reader.rb'

class Order
  attr_accessor :book, :reader
  attr_reader   :date

  def initialize(book, reader)
    @book     = book
    @reader   = reader
    @date     = Time.now
  end
end

