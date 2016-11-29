
require_relative 'library'

lib = Library.new
lib.load_content

p lib.get_most_popular_book
p lib.get_most_popular_reader
p lib.three_most_popular_books


