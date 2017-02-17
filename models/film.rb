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
    sql = "INSERT INTO films 
    (title,price) 
    VALUES 
    ('#{@title}',
    '#{@price}',
    RETURNING *"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map { |film| Film.new(film)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i
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
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end


end