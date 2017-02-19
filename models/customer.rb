require_relative('../db/sql_runner.rb')

class Customer
  attr_reader :name, :id
  attr_accessor :funds

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "INSERT INTO customers
    (name,funds)
    VALUES
    ('#{@name}',
    '#{@funds}')
    RETURNING *;"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map { |customer| Customer.new(customer)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i
  end

  def display
    sql = "SELECT * FROM customers WHERE id = #{@id}"
    result = SqlRunner.run(sql)
    resultobject = result.map { |customer| Customer.new(customer)}
    return resultobject
  end

  def self.display_all
    sql = "SELECT * FROM customers"
    result = SqlRunner.run(sql)
    resultobjects = result.map { |customer| Customer.new(customer)}
    return resultobjects
  end

  def update_funds(newfunds)
    sql = "UPDATE customers SET funds = #{newfunds} WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def tickets
    sql = "SELECT * FROM films 
    INNER JOIN tickets ON tickets.film_id = films.id
    WHERE customer_id = #{@id}"
    result = SqlRunner.run(sql)
    resultobjects = result.map { |ticket| Ticket.new(ticket)}
    return resultobjects
  end


end