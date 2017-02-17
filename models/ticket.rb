require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id, :film_id, :customer_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id']
    @customer_id = options['customer_id']
    @time = options['time']
  end

  def save
    sql = "INSERT INTO 
    tickets (film_id,customer_id,time) 
    VALUES 
    ('#{@film_id}', 
    '#{@customer_id}', 
    '#{@time}') 
    RETURNING *;"
    firstresult = SqlRunner.run(sql)
    resultobject = firstresult.map {|ticket| Ticket.new(ticket)}
    idasstring = resultobject[0].id
    @id = idasstring.to_i
  end

  def display
    sql = "SELECT * FROM tickets WHERE id = #{@id}"
    result = SqlRunner.run(sql)
  end

  def self.display_all
  end

  def update
  end

  def delete
  end

  def self.delete_all
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

end