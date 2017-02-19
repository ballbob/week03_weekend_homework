require_relative('../db/sql_runner.rb')

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
    '#{@price}')
    RETURNING *"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map { |film| Film.new(film)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i
  end

  def display
    sql = "SELECT * FROM films where id = #{@id}"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map { |film| Film.new(film)}
    return resultobject
  end

  def self.display_all
    sql = "SELECT * FROM films"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map { |film| Film.new(film)}
    return resultobject
  end

  def update_price(newprice)
    sql = "UPDATE films SET price = #{newprice} WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM films WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end


end