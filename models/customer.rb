require('../db/sql_runner.rb')

class Customer
  attr_reader :name, :id
  attr_accessor :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i
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