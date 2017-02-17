require('../db/sql_runner.rb')

class Film
  attr_reader :id, :title
  attr_accessor :price
  def initialize(options)
    @title = options['title']
    @price = options['price']
    @id = options['id'].to_i if options['id']
  end
end