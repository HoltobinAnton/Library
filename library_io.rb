
require 'yaml'

module ModuleIO

  def save_content
    File.open('data/library.yaml','w') do |f|
      f.write(self.to_yaml)
    end
  end

  def load_content
    object = YAML.load(File.read('data/library.yaml'))
    raise 'Error connecting to database' if object.nil?
    self.books    = object.books
    self.authors  = object.authors
    self.readers  = object.readers
    self.orders   = object.orders
  end

  def add_content(book, order, readers, authors)
    @books    << book
    @orders   << order
    @readers  << readers
    @authors  << authors
  end

end