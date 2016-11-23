
require_relative 'book.rb'
require_relative 'order.rb'
require_relative 'reader.rb'
require_relative 'author.rb'
require_relative 'library_io.rb'

class Library
  include(ModuleIO)

  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books, @orders, @readers, @authors  =  [],[],[],[]
  end

  def get_most_popular_book
    most_popular('book','title')
  end

  def get_most_popular_reader
    most_popular('reader','name')
  end

  def three_most_popular_books
    three_book = most_popular(:book,:title,3)
    @orders.select{|order| three_book.include?(order.book.title)}.uniq(&:reader).length
  end

  private
  def most_popular(obj,attr,count = 1)
    @orders.group_by{|order|order.send(obj).send(attr)}.max_by(count){|_,v|v.size}.map(&:first)
  end

end

lib = Library.new
lib.load_content

p lib.get_most_popular_book
p lib.get_most_popular_reader
p lib.three_most_popular_books


