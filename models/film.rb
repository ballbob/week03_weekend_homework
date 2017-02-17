require('../db/sql_runner.rb')

class Film

  attr_reader :id, :title
  attr_accessor :price

  def initialize(options)
    @title = options['title']
    @price = options['price']
    @id = options['id'].to_i if options['id']
  end

  def save
  end

  def display
  end

  def self.display_all
  end

  def update
  end

  def delete
  end

  def self.delete_all
  end


end